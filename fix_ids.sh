set -euo pipefail

echo "==> 1) Verificando bblocks existentes..."
ls -la _sources || { echo "ERROR: no existe _sources en la raíz"; exit 1; }

echo "==> 2) Mostrando itemIdentifier actuales:"
grep -R "\"itemIdentifier\"" -n _sources | head -n 200 || true

echo "==> 3) Corrigiendo IDs a prefijo ogc.ubcp.* (itemIdentifier y dependsOn)..."
python - <<'PY'
import json, glob, os, re

def load_json(p):
    with open(p, "r", encoding="utf-8") as f:
        return json.load(f)

def save_json(p, data):
    with open(p, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
        f.write("\n")

# Reglas de normalización:
# - ogc.ubcp.core            => ogc.ubcp.core
# - ubcp.core                => ogc.ubcp.core
# - ogc.core                 => ogc.ubcp.core (por si existe)
# - ogc.extension.lidar      => ogc.ubcp.extension.lidar
# - ubcp.extension.lidar     => ogc.ubcp.extension.lidar
# - ogc.ubcp.extension.lidar => ogc.ubcp.extension.lidar
# y lo mismo para thermal/multispectral/rtk + profile

def norm_id(s: str) -> str:
    s = s.strip()

    # core
    if s in ("ubcp.core", "ogc.core", "core", "ogc.ubcp.core"):
        return "ogc.ubcp.core"

    # profile
    if s in ("ubcp.profile", "ogc.profile", "profile", "ogc.ubcp.profile"):
        return "ogc.ubcp.profile"

    # extensions (permitimos varios prefijos heredados)
    for ext in ("lidar", "thermal", "multispectral", "rtk"):
        if s in (f"ubcp.extension.{ext}", f"ogc.extension.{ext}", f"extension.{ext}", f"ogc.ubcp.extension.{ext}"):
            return f"ogc.ubcp.extension.{ext}"

    # si ya viene bien
    if s.startswith("ogc.ubcp."):
        return s

    return s  # no tocamos otros

paths = sorted(glob.glob("_sources/**/bblock.json", recursive=True))
if not paths:
    raise SystemExit("ERROR: No encuentro _sources/**/bblock.json")

changed = 0
for p in paths:
    data = load_json(p)

    # itemIdentifier
    if "itemIdentifier" in data:
        old = data["itemIdentifier"]
        new = norm_id(old)
        if new != old:
            data["itemIdentifier"] = new
            changed += 1
            print(f"UPDATED itemIdentifier: {p} :: {old} -> {new}")

    # dependsOn
    if "dependsOn" in data and isinstance(data["dependsOn"], list):
        newdeps = []
        dep_changed = False
        for d in data["dependsOn"]:
            if isinstance(d, str):
                nd = norm_id(d)
                if nd != d:
                    dep_changed = True
                    print(f"UPDATED dependsOn: {p} :: {d} -> {nd}")
                newdeps.append(nd)
            else:
                newdeps.append(d)
        if dep_changed:
            data["dependsOn"] = newdeps
            changed += 1

    save_json(p, data)

print(f"\nDONE. Files changed (counted operations): {changed}")
PY

echo "==> 4) Comprobación rápida: IDs y dependsOn tras el fix"
echo "-- itemIdentifier:"
grep -R "\"itemIdentifier\"" -n _sources/ogc/ubcp 2>/dev/null || grep -R "\"itemIdentifier\"" -n _sources | head -n 200

echo "-- dependsOn:"
grep -R "\"dependsOn\"" -n _sources | head -n 200 || true

echo "==> 5) Commit + push"
git status --porcelain
git add _sources
git commit -m "Normalize bblock IDs and dependsOn to ogc.ubcp.*" || true
git push origin main

echo "OK. Vuelve a Actions: se relanza y debería pasar."
