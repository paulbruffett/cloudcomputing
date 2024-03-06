CREATE EXTERNAL TABLE IF NOT EXISTS soil.georeferences(
 `SSN` string,
 `Public` boolean,
 `Latitude` float,
 `Longitude` float,
 `Cluster` int,
 `Plot` int,
  `Depth` string,
 `Soil` string,
 `material` string,
 `scientist` string,
 `Site` string,
 `Country` string,
 `Region` string,
  `Cultivated` boolean,
 `Gid` int
 )
 ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
 LOCATION 's3://afsis/2009-2013/Georeferences/'
  TBLPROPERTIES ("skip.header.line.count"="1")