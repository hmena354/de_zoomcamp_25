CREATE OR REPLACE EXTERNAL TABLE `eloquent-ratio-447722-t0.ny_taxi_trips_external.ny_taxi_trips_external`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://hw3-seachalk/*.parquet'],
  metadata_cache_mode = 'AUTO'  -- Enables metadata caching
);

SELECT DISTINCT PULocationID FROM `ny_taxi_trips_external.green_taxi_external`;

SELECT DISTINCT PULocationID FROM `ny_taxi_trips_external.ny_taxi_trips_native`;

SELECT COUNT(1) FROM `ny_taxi_trips_external.green_taxi_external` WHERE fare_amount = 0

