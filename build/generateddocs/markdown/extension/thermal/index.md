
# extension.thermal (Schema)

`ogc.extension.thermal` *v0.1.0*

UAV biodiversity building block

[*Status*](http://www.opengis.net/def/status): Under development

## Description

## Purpose

Adds **thermal-specific** capture requirements needed to interpret radiometric thermal imagery in biodiversity monitoring.

## Typical sources

Vendor EXIF/MakerNotes plus calibration artefacts stored alongside the dataset.

## Examples

### Example for UBCP Thermal Extension
#### json
```json
{
  "emissivity": 0.98,
  "thermal_calibration": "factory-cal-2025-07",
  "radiometric_temperature_model": "vendor-model-v1"
}

```

## Schema

```yaml
$schema: https://json-schema.org/draft/2020-12/schema
title: UBCP Thermal Extension
type: object
additionalProperties: false
properties:
  emissivity:
    type: number
    minimum: 0
    maximum: 1
  thermal_calibration:
    type: string
    description: Identifier or description of thermal calibration coefficients/procedure.
  radiometric_temperature_model:
    type: string
    description: Reference to the model used to convert raw counts to temperature.
required:
- emissivity

```

Links to the schema:

* YAML version: [schema.yaml](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/thermal/schema.json)
* JSON version: [schema.json](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/thermal/schema.yaml)


# For developers

The source code for this Building Block can be found in the following repository:

* URL: [https://github.com/MayteToscano/bblocks-uav-biodiversity](https://github.com/MayteToscano/bblocks-uav-biodiversity)
* Path: `_sources/extension.thermal`

