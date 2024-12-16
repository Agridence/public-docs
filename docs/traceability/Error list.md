## File Upload Errors

**1. File Parsing**

Below are some errors commonly found when users upload their file. 

| Error | Description |
| ----------- | ----------- |
| Invalid GeoJSON file | One or more features in the feature collection is invalid. This could be due to the open shape of polygon type features where the last coordinate is not the same as the first. |
| Invalid JSON file | The contents of the file must follow the GeoJSON specification https://datatracker.ietf.org/doc/html/rfc7946. For example - [Plantation Data (JSON) Upload Template](https://assets.agridence.com/docs-assets/traceability/sample-geojson.json). If the file contains geojson content, ensure that the JSON is valid. This may happen due to improper handling of special characters during file generation. 
| Invalid file headers | Excel file headers do not match the template [Plantation Data (Excel) Upload Template](https://storage.googleapis.com/agd-public-assets/agd-traceability/crd/samples/Plantation%20Data%20Upload%20Template.xlsx). The excel/csv file uploaded does not contain data that can be read by the system. Ensure that there is no password protection in the files.  
| Missing required property in GeoJSON | There are missing properties in your GeoJSON file. See [GeoJSON properties](https://agridence.github.io/public-docs/traceability/file_uploads) for the required and optional properties that should be included in your GeoJSON file. 
| File size exceeded | File size has exceeded the limit for your plan. Please contact administrator if you would like to upload a larger file.  

**2. Geometry Data**

Below are the errors relating to the geometry data that will be flagged out by our system if they are found within the file uploaded. 
| Error | Criticality | Description |
| ----------- | ----------- | ----------- |
| invalid_geometry_format | High | The geometry format is neither GeoJSON, WKT or WKB. Ensure the geometry data is in the correct format
|plantation_area_too_large | High | The calculated area is too large
|coordinates_length | Medium | The length of coordinates must be at least 6 decimal places.
| eudr_4ha_rule |  Medium | The geometry’s area was supplied as >4ha but type is Point.
| geometry_too_many_edges |  Medium | The geometry has too many edges. This may be an erratic polygon.
| area_mismatch | Medium | The area declared vs area calculated (Polygon type) mismatched than a certain threshold.
| is_simple | Medium | The shape is not a simple shape. For example, lines may be represented using multiple points when only 2 are sufficient. This causes data size to be larger.
| polygon_shape_not_closed | Low | The polygon does not form a closed shape.
