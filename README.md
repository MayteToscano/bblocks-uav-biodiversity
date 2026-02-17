# UBCP – UAV Biodiversity Capture Profile (OGC Building Blocks)

This repository follows the same structure as other OGC Building Blocks incubator examples (e.g., *bblocks-Inspire-AdministrativeBoundary*).

## Building blocks in this collection

- `core` — Core UAV Capture Module (mandatory baseline)
- `extension.thermal` — Thermal extension
- `extension.multispectral` — Multispectral extension
- `extension.lidar` — LiDAR extension
- `extension.rtk` — RTK/GNSS precision extension
- `profile` — Aggregating profile (depends on core + extensions)

All sources live under `_sources/<block>/`

## Build (local)

Prerequisites: Docker.

```bash
docker run --rm \
  -v "$(pwd):/workspace" \
  -w /workspace \
  ghcr.io/opengeospatial/bblocks-postprocess:latest \
  --clean true \
  --items-dir _sources \
  --config-file bblocks-config.yaml \
  --base-url "https://<YOUR-USER>.github.io/<YOUR-REPO>/"
```

The generated outputs will be under `build/` (register, schemas, viewer, tests).

## GitHub Pages

Enable GitHub Pages for this repository and publish from the default workflow output (the reusable OGC workflow will push the generated site as configured).
