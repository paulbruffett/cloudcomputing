import sys
from pyspark.sql.types import (
    StructType, StructField, IntegerType, StringType
)

from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# ---------------------------------------------------
# Explicit schema for GDELT v2 Mentions (as requested)
# ---------------------------------------------------
schema = StructType([
    StructField("GlobalEventID", IntegerType(), True),
    StructField("EventTimeDate", StringType(), True),
    StructField("MentionTimeDate", StringType(), True),
    StructField("MentionType", IntegerType(), True),
    StructField("MentionSourceName", StringType(), True),
    StructField("MentionIdentifier", StringType(), True),
    StructField("SentenceID", IntegerType(), True),
    StructField("Actor1CharOffset", IntegerType(), True),
    StructField("Actor2CharOffset", IntegerType(), True),
    StructField("ActionCharOffset", IntegerType(), True),
    StructField("InRawText", IntegerType(), True),
    StructField("Confidence", IntegerType(), True),
    StructField("MentionDocLen", IntegerType(), True),
    StructField("MentionDocTone", IntegerType(), True),
    StructField("MentionDocTranslationInfo", StringType(), True),
    StructField("Extras", StringType(), True)
])

# ---------------------------------------------------
# Read TSV (tab-separated) files directly from S3
# ---------------------------------------------------
input_path = "s3://gdelt-open-data/v2/mentions/"

df = (
    spark.read
         .format("csv")
         .option("sep", "\t")          # tab delimiter
         .option("header", "false")    # no header row in GDELT files
         .option("quote", "")          # no quoting
         .option("escape", "")         # no escaping
         .option("mode", "DROPMALFORMED")
         .schema(schema)               # apply explicit schema
         .load(input_path)
)

# ---------------------------------------------------
# Output: Parquet for downstream Iceberg table
# ---------------------------------------------------
output_path = "s3://<your bucket>/gdeltv2/mentionsparquet/"

(
    df.write
      .mode("overwrite")      # change to "append" if you want incremental loads
      .parquet(output_path)
)

job.commit()