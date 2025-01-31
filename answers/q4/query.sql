SELECT COUNT(*) 
FROM `kestra-de.bq_dataset.green_tripdata`
WHERE file LIKE 'green_tripdata_2020_%';