# Loading Data into S3
aws s3api create-bucket --bucket DE-SQL-Snowflake-AWS --region us-east-1
aws s3 cp  D:/Proyectos/DE-SQL-Snowflake-AWS/data/ s3://de-snowflake-raw --recursive






