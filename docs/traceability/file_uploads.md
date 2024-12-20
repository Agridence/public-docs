## Format Details

Files must be in **json (.json)** or **excel (.xlsx)** format.

## Process for data upload

Follow the steps outlined below to upload data from files into your polygon mapping dataset:

1. Ensure that files uploaded are either in JSON or Excel format, containing the geolocation data in the specified format below.
2. Once the file has been uploaded, please address and verify the errors identified before proceeding to import the data.
![Sample error page](https://assets.agridence.com/docs-assets/traceability/post-file-upload-errors-checks.png)
3. **Note**: For system to calculate the area for polygon type geometries, keep the area value as -1. Else, specify the area of polygon in the respective fields.

### GeoJSON/JSON

1. For JSON format, the mandatory fields are: **Production Place = Plantation Name**, **Area = Calculated hectarage or '-1'**(See above point 3: Note) and **Geometry = Coordinates**. 

**GeoJSON File Properties**

| Properties | Description |
| ----------- | ----------- |
| PlantationCode |Unique identifier of the farm. If this is absent, ProductionPlace will be used as the unique identifier in PMD.
| ProductionPlace (Required)| This will become the plantation name in PMD. If PlantationCode is not provided for a feature, this will be used as the plantation code also.
| Area (Required) | Must be provided in hectares. If geometry type is not Point, -1 can be set to indicate system to calculate this.
| YearOfPlanting | Planting year of farm as integer value (optional, default null).
| MonthlyAverageYield | Average yield (kg) per hectare of farm (optional, default null).

2. Download the file template here: [Plantation Data (JSON) Upload Template](https://assets.agridence.com/docs-assets/traceability/sample-geojson.json).

**Polygon**
```
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "ProductionPlace": "Plantation Code",
           "PlantationName": "Plantation Name",
        "Area": -1
      },
      "geometry": {
        "coordinates": [
          [
            [-66.09893281292211, -0.2036380639064106],
            [-66.09893281292211, -2.969030702238115],
            [-60.43733612319035, -2.969030702238115],
            [-60.43733612319035, -0.2036380639064106],
            [-66.09893281292211, -0.2036380639064106]
          ]
        ],
        "type": "Polygon"
      }
    },
```
**Point**
```
{
      "type": "Feature",
      "properties": {
        "ProductionPlace": "Plantation Code",
           "PlantationName": "Plantation Name",
        "Area": 1.5
      },
      "geometry": {
        "coordinates": [
          103.84799762302129,
          1.2804099083524108
        ],
        "type": "Point"
      }
    }
  ]
}
```
### Excel
1. For Excel format, data must be organised in the same format as the template below, with the 5 column headers: **Plantation Code** (can be the same as plantation name), **Plantation Name**, **Land Area (ha)**, **Date Created** and **Geometry**.
2. Download the file template here: [Plantation Data (Excel) Upload Template](https://assets.agridence.com/docs-assets/traceability/plantation-data-uploadtemplate.xlsx).
3. Polygon/GPS point coordinates should be in WKT format.



## FAQs

Some commonly asked questions here.

1. What is WKT format ?

Well Known Text (WKT) is a commonly used format for encoding geometry data, particularly suitable for storing as strings.
More details can be found [here](https://libgeos.org/specifications/wkt/).
