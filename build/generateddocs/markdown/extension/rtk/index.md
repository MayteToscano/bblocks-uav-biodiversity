
# extension.rtk (Schema)

`ogc.extension.rtk` *v0.1.0*

UAV biodiversity building block

[*Status*](http://www.opengis.net/def/status): Under development

## Description

## Purpose

Adds GNSS/RTK quality indicators needed to reason about positional uncertainty and downstream alignment.

## Examples

### Example for UBCP RTK Extension
#### json
```json
{
  "positioning_mode": "RTK",
  "rtk_std_lat_m": 0.0145,
  "rtk_std_lon_m": 0.0118,
  "rtk_std_hgt_m": 0.0272,
  "rtk_diff_age_s": 0.4
}

```

## Schema

```yaml
$schema: https://json-schema.org/draft/2020-12/schema
title: UBCP RTK/GNSS Precision Extension
type: object
additionalProperties: false
properties:
  positioning_mode:
    type: string
    description: GNSS positioning mode (e.g., RTK, PPK, SPS).
  rtk_std_lat_m:
    type: number
    minimum: 0
  rtk_std_lon_m:
    type: number
    minimum: 0
  rtk_std_hgt_m:
    type: number
    minimum: 0
  rtk_diff_age_s:
    type: number
    minimum: 0
required:
- positioning_mode

```

Links to the schema:

* YAML version: [schema.yaml](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/rtk/schema.json)
* JSON version: [schema.json](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/rtk/schema.yaml)


# For developers

The source code for this Building Block can be found in the following repository:

* URL: [https://github.com/MayteToscano/bblocks-uav-biodiversity](https://github.com/MayteToscano/bblocks-uav-biodiversity)
* Path: `_sources/extension.rtk`

