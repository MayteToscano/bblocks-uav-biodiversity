
# profile (Schema)

`ogc.profile` *v0.1.0*

UAV biodiversity building block

[*Status*](http://www.opengis.net/def/status): Under development

## Description

## Purpose

Defines the **UBCP Profile** as an aggregation of:

- `ogc.ubcp.core` (mandatory)
- `ogc.ubcp.extension.*` (optional, as applicable)

This is a convenient entry point for validation and packaging.

## Examples

### Example for UBCP Profile (Core + Extensions)
#### json
```json
{
  "core": {
    "temporal_reference": "2026-02-17T08:00:00Z",
    "spatial_reference": {
      "latitude_deg": 44.74835,
      "longitude_deg": 22.43592,
      "altitude_m": 416.7
    },
    "platform_orientation": {
      "yaw_deg": 71.1,
      "pitch_deg": 3.8,
      "roll_deg": 3.7
    },
    "sensor_identification": {
      "platform_model": "Matrice 350 RTK",
      "sensor_model": "H20T",
      "firmware_version": "07.00.01.05"
    },
    "optical_configuration": {
      "focal_length_mm": 13.5,
      "exposure_time_s": 0.002,
      "iso": 100,
      "f_number": 1.0
    },
    "crs_declaration": {
      "horizontal_crs": "http://www.opengis.net/def/crs/EPSG/0/4326",
      "vertical_reference": "AboveSeaLevel"
    },
    "processing_lineage": {
      "activity_id": "capture-272d5ad8b6eb11ef",
      "preprocessing_applied": false,
      "lineage_statement": "Raw capture metadata recorded by platform."
    }
  },
  "rtk": {
    "positioning_mode": "RTK",
    "rtk_std_lat_m": 0.0145,
    "rtk_std_lon_m": 0.0118,
    "rtk_std_hgt_m": 0.0272,
    "rtk_diff_age_s": 0.4
  }
}

```

## Schema

```yaml
$schema: https://json-schema.org/draft/2020-12/schema
title: UBCP Profile
description: An aggregate object that contains Core plus optional extensions.
type: object
additionalProperties: false
properties:
  core:
    $ref: https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/core/schema.yaml
  thermal:
    $ref: https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/thermal/schema.yaml
  multispectral:
    $ref: https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/multispectral/schema.yaml
  lidar:
    $ref: https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/lidar/schema.yaml
  rtk:
    $ref: https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/rtk/schema.yaml
required:
- core

```

Links to the schema:

* YAML version: [schema.yaml](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/profile/schema.json)
* JSON version: [schema.json](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/profile/schema.yaml)


# For developers

The source code for this Building Block can be found in the following repository:

* URL: [https://github.com/MayteToscano/bblocks-uav-biodiversity](https://github.com/MayteToscano/bblocks-uav-biodiversity)
* Path: `_sources/profile`

