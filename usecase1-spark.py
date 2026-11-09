from pyspark.sql import SparkSession
spark = SparkSession.builder\
    .appName("UseCase1")\
    .getOrCreate()
order_data_df = spark.read.csv("./output/raw_data/training/order", header=True, inferSchema=True)
lineitem_data_df = spark.read.csv("./output/raw_data/training/lineitem", header=True, inferSchema=True)
order_returns_data_df = spark.read.csv("./output/raw_data/training/order_returns", header=True, inferSchema=True)
