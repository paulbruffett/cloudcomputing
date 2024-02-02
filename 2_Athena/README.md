# GDELT Dataset Analysis

### Description
>Supported by Google Jigsaw, the GDELT Project monitors the world's broadcast, print, and web news from nearly every corner of every country in over 100 languages and >identifies the people, locations, organizations, themes, sources, emotions, counts, quotes, images and events driving our global society every second of every day, >creating a free open platform for computing on the entire world.

### Lab Description
This dataset is already hosted in Amazon Web Services for free, in this lab we will be accessing the data hosted in S3 and analyzing it using Amazon Athena

[AWS Dataset Description](https://aws.amazon.com/public-datasets/gdelt/)
[GDELT Dataset Description](http://data.gdeltproject.org/documentation/GDELT-Event_Codebook-V2.0.pdf)

For this lab we will use the SQL scripts in this repository to create dimension tables and access the GDELT data as the dimension tables.

To explore the dataset using the AWS CLI;
```
aws s3 ls gdelt-open-data/events/

aws s3 cp s3://gdelt-open-data/events/20171226.export.csv 20171226.export.csv
```

### Optimizing the query
By default it takes about 30 seconds and scans 154 GB of data to return a query, by converting it to parquet we can reduce this to about 5 seconds and 2.31 GB of data, reducing the cost considerably.  This requires an EMR cluster and the scripts in the parquet folder.
