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
