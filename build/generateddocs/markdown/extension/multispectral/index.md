
# extension.multispectral (Schema)

`ogc.extension.multispectral` *v0.1.0*

UAV biodiversity building block

[*Status*](http://www.opengis.net/def/status): Under development

## Description

## Purpose

Adds **band and radiometric reference** fields to support multispectral reflectance products and vegetation indices.

## Examples

### Example for UBCP Multispectral Extension
#### json
```json
{
  "band_name": "Blue",
  "central_wavelength_nm": 450,
  "fwhm_nm": 16,
  "irradiance_reference": "sun-sensor",
  "reflectance_conversion_model": "vendor-reflectance-v2"
}

```

## Schema

```yaml
$schema: https://json-schema.org/draft/2020-12/schema
title: UBCP Multispectral Extension
type: object
additionalProperties: false
properties:
  band_name:
    type: string
  central_wavelength_nm:
    type: number
    minimum: 0
  fwhm_nm:
    type: number
    minimum: 0
  irradiance_reference:
    type: string
    description: Irradiance / downwelling light reference measurement.
  reflectance_conversion_model:
    type: string
required:
- band_name
- central_wavelength_nm

```

Links to the schema:

* YAML version: [schema.yaml](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/multispectral/schema.json)
* JSON version: [schema.json](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/extension/multispectral/schema.yaml)


# For developers

The source code for this Building Block can be found in the following repository:

* URL: [https://github.com/MayteToscano/bblocks-uav-biodiversity](https://github.com/MayteToscano/bblocks-uav-biodiversity)
* Path: `_sources/extension.multispectral`

