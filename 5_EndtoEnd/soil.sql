CREATE EXTERNAL TABLE IF NOT EXISTS soil.georeferences(
 `SSN` string,
 `Public` boolean,
 `Latitude` float,
 `Longitude` float,
 `Cluster` int,
 `Plot` int,
  `Depth` string,
 `Soil material` string,
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

CREATE EXTERNAL TABLE IF NOT EXISTS soil.cropnuts(
 `SSN` string,
 `Public` string,
 `EC` float,
 `ExAc` float,
 `ExBas` float,
 `Al` float,
 `B` float,
 `Ca` float,
 `Cu` float,
 `Fe` float,
 `K` float,
  `Mg` float,
   `Mn` float,
 `Na` float,
 `P` float,
  `S` float,
 `Zn` float,
   `PH` float,
 `PSI` float
 )
 ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
 LOCATION 's3://afsis/2009-2013/Wet_Chemistry/CROPNUTS/'
  TBLPROPERTIES ("skip.header.line.count"="1")