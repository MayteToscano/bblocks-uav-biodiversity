
# core (Schema)

`ogc.core` *v0.1.0*

UAV biodiversity building block

[*Status*](http://www.opengis.net/def/status): Under development

## Description

## Purpose

This building block defines the **minimum interoperable UAV capture metadata** needed to interpret biodiversity UAV observations.

## Scope

Mandatory baseline fields covering:

- temporal reference
- spatial reference
- platform orientation
- sensor identification
- optical configuration
- CRS declaration
- (optional) high-level processing lineage

## Mapping (indicative)

- **ISO 19115 / ISO 19115-2**: metadata + acquisition
- **ISO 19111**: CRS identifiers
- **OGC GeoPose**: pose/orientation concepts
- **OGC SensorML / SOSA-SSN**: sensor and procedure modelling
- **PROV-O**: lineage concepts
- **STAC**: packaging of imagery assets (when applicable)

## Examples

### Example for UBCP Core UAV Capture Module (Mandatory Base)
#### json
```json
{
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
}

```

## Schema

```yaml
$schema: https://json-schema.org/draft/2020-12/schema
title: UBCP Core UAV Capture Module (Mandatory Base)
type: object
additionalProperties: false
properties:
  temporal_reference:
    description: Capture timestamp in ISO 8601.
    type: string
    format: date-time
  spatial_reference:
    description: Spatial position of the capture (WGS84 lat/lon) and altitude.
    type: object
    additionalProperties: false
    properties:
      latitude_deg:
        type: number
        minimum: -90
        maximum: 90
      longitude_deg:
        type: number
        minimum: -180
        maximum: 180
      altitude_m:
        type: number
    required:
    - latitude_deg
    - longitude_deg
  platform_orientation:
    description: UAV orientation at exposure (degrees).
    type: object
    additionalProperties: false
    properties:
      yaw_deg:
        type: number
      pitch_deg:
        type: number
      roll_deg:
        type: number
    required:
    - yaw_deg
    - pitch_deg
    - roll_deg
  sensor_identification:
    description: Identifiers for the sensor and platform.
    type: object
    additionalProperties: false
    properties:
      platform_model:
        type: string
      platform_serial:
        type: string
      sensor_model:
        type: string
      sensor_serial:
        type: string
      firmware_version:
        type: string
    required:
    - platform_model
    - sensor_model
  optical_configuration:
    description: Basic optical configuration of the sensor.
    type: object
    additionalProperties: false
    properties:
      focal_length_mm:
        type: number
      f_number:
        type: number
      exposure_time_s:
        type: number
      iso:
        type: integer
        minimum: 0
    required:
    - focal_length_mm
    - exposure_time_s
  crs_declaration:
    description: CRS identifiers used for horizontal and vertical referencing.
    type: object
    additionalProperties: false
    properties:
      horizontal_crs:
        type: string
      vertical_reference:
        type: string
    required:
    - horizontal_crs
  processing_lineage:
    description: High-level lineage description of capture/processing.
    type: object
    additionalProperties: false
    properties:
      activity_id:
        type: string
      preprocessing_applied:
        type: boolean
      lineage_statement:
        type: string
required:
- temporal_reference
- spatial_reference
- platform_orientation
- sensor_identification
- optical_configuration
- crs_declaration

```

Links to the schema:

* YAML version: [schema.yaml](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/core/schema.json)
* JSON version: [schema.json](https://maytetoscano.github.io/bblocks-uav-biodiversity/build/annotated/core/schema.yaml)


# For developers

The source code for this Building Block can be found in the following repository:

* URL: [https://github.com/MayteToscano/bblocks-uav-biodiversity](https://github.com/MayteToscano/bblocks-uav-biodiversity)
* Path: `_sources/core`

