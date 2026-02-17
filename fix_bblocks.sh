set -euo pipefail

# 0) Asegurar repo limpio y en main (evita "rebasing"/detached HEAD)
git rebase --abort 2>/dev/null || true
git merge --abort 2>/dev/null || true
git checkout main 2>/dev/null || git checkout -b main

# 1) Sincroniza con remoto (evita el "non-fast-forward")
git fetch origin
git reset --hard origin/main

# 2) Crea/actualiza el workflow EXACTO (como el repo que funciona)
mkdir -p .github/workflows
cat > .github/workflows/process-bblocks.yml <<'YML'
name: Validate and process Building Blocks

on:
  workflow_dispatch:
  push:
    branches:
      - master
      - main

permissions:
  contents: write
  pages: write
  id-token: write

jobs:
  validate-and-process:
    uses: opengeospatial/bblocks-postprocess/.github/workflows/validate-and-process.yml@master
YML

# 3) Config mínimo correcto (ajusta base-url al nombre real del repo)
cat > bblocks-config.yaml <<'YML'
name: bblocks-uav-biodiversity
base-url: "https://maytetoscano.github.io/bblocks-uav-biodiversity/"
imports:
  - "https://opengeospatial.github.io/bblocks/register.json"
YML

# 4) Commit + push
git add .github/workflows/process-bblocks.yml bblocks-config.yaml
git commit -m "Fix workflow + bblocks-config for Pages" || true
git push origin main
echo "OK: pushed. Ve a Actions y espera a que el workflow termine en verde."
