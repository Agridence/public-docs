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

| Error | Criticality | Category | Error Message | Error Handling | 
| ----------- | ----------- | ----------- | ----------- | ----------- |
| Invalid geometry format | High | Invalid geometry | The geometry format is neither GeoJSON, WKT or WKB. Ensure the geometry data is in the correct format. | Cannot be uploaded 
| Geometry first and last coordinate do not match | High | Invalid geometry | Points of LinearRing do not form a closed linestring | Cannot be uploaded
| Geometry has intersecting coordinates | High | Invalid geometry | Geometry is invalid. Self-intersection | Cannot be uploaded 
| Geometry with too few coordinates | High | Invalid geometry | Too few points in geometry component. | Cannot be uploaded
|Plantation area too large | Medium | Data quality | The calculated area is too large, exceeded threshold of 100 edges. | Able to upload but system will advise that polygon might be erroneous.		
| Geometry too many edges |  Medium | Data quality | The geometry has too many edges. This may be an erroneous polygon. | Able to upload but system will advise that polygon might be erroneous.		
| Area mismatch | Medium | Data quality | The area declared vs area calculated (Polygon type) mismatched than a certain threshold. | Able to upload but system will advise that polygon might be erroneous.	
| Is not simple | Medium | Data quality | The shape is not a simple shape. For example, lines may be represented using multiple points when only 2 are sufficient. This causes data size to be larger. | System autocorrects (to be implemented) |
|EUDR 4ha rule |  Medium | Validation | The geometry data is more than 4 hectares, but is a GPS point. | Able to upload
|Coordinates length too short | Medium | Validation | The length of coordinates must be at least 6 decimal places according to EUDR.| Able to upload
| Polygon shape not closed | Low | Invalid geometry | The polygon does not form a closed shape. | Cannot be uploaded. Auto-close will be implemented in the future 
| Right hand rule | Low | Invalid geometry | Geometry does not follow right hand rule.| System autocorrects
| Out of adminstrative boundary | Low | Data Quality | Geometry is out of known boundaries (in the ocean). | Able to upload, but system will flag as 'Invalid Geometry'.
| Duplicate coordinates | Low | Data quality | Geometry has sequential duplicate coordinates | System autocorrects
| Inversed lat long | Low | Data quality |  Longtitude and latitude inversed | Able to upload but system will advise that polygon might be erroneous.		
	
	
	
