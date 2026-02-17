
# extension.lidar (Schema)

`ogc.extension.lidar` *v0.1.0*

UAV biodiversity building block

[*Status*](http://www.opengis.net/def/status): Under development

## Description

## Purpose

Adds point cloud acquisition parameters relevant for habitat structure, canopy metrics, and terrain modelling.

## Examples

### Example for UBCP LiDAR Extension
#### json
```json
{
  "point_density": 120.0,
  "scan_pattern": "zigzag",
  "return_number": 2,
  "intensity_calibration": "intensity-cal-v1"
}

```

## Schema

```yaml
$schema: https://json-schema.org/draft/2020-12/schema
title: UBCP LiDAR Extension
type: object
additionalProperties: false
properties:
  point_density:
    type: number
    minimum: 0
    description: "Nominal point density (pts/m\xB2)."
  scan_pattern:
    type: string
  return_number:
    type: integer
    minimum: 1
  intensity_calibration:
    type: string
required:
- point_density

```

Links to the schema:

* YAML version: [schema.yaml](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/lidar/schema.json)
* JSON version: [schema.json](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/lidar/schema.yaml)


# For developers

The source code for this Building Block can be found in the following repository:

* URL: [https://github.com/MayteToscano/bblocks-uav-biodiversity](https://github.com/MayteToscano/bblocks-uav-biodiversity)
* Path: `_sources/extension.lidar`

