1. Within the execution for Yellow Taxi data for the year 2020 and month 12: what is the uncompressed file size (i.e. the output file <em>yellow_tripdata_2020-12.csv</em> of the extract task)? \
    **Answer:** 128.3 MB 

    Explanation:
      - After ingestion of the whole required data(2019-01 to 2021-07), checked the GCS bucket for a file with name yellow_tripdata_2020-12.csv and then its size is the answer.

2. What is the rendered value of the variable file when the inputs taxi is set to green, year is set to 2020, and month is set to 04 during execution? \
    **Answer:** green_tripdata_2020-04.csv 
 
    Explanation:
    - Variable rendering is very similar to 
    string interpolation in Python. In that very case:
        ~~~
        taxi = "green"
        year = "2020"
        mo = "04"
        res = f'{taxi}_tripdata_{year}-{mo}.csv'
        ~~~
        <em>res</em> will be rendered value.(for explanation purposes 
        only, as it's easily done in the mind) 

3. How many rows are there for the Yellow Taxi data for all CSV files in the year 2020? \
    **Answer:** 24,648,499 

    Explanation:
    - Given the merged BQ dataset, 
    we can find the answer using the following query(./q3/query.sql):
        ~~~
        SELECT COUNT(*) 
        FROM `kestra-de.bq_dataset.yellow_tripdata`
        WHERE file LIKE 'yellow_tripdata_2020_%';
        ~~~
4. How many rows are there for the Green Taxi data for all CSV files in the year 2020? \
    **Answer:** 1,734,051 

    Explanation: 
    - Same as q3, slightly different query(./q4/query.sql).
        ~~~
        SELECT COUNT(*) 
        FROM `kestra-de.bq_dataset.green_tripdata`
        WHERE file LIKE 'green_tripdata_2020_%';
        ~~~

5. How many rows are there for the Yellow Taxi data for the March 2021 CSV file? \
    **Answer:** 1,925,152

    Explanation:
    - Two ways, how it can be solved in my setup:
        - Same as prev, slightly different query(./q5/sol1_query.sql):
            ~~~
            SELECT COUNT(*) 
            FROM `kestra-de.bq_dataset.yellow_tripdata`
            WHERE file = 'yellow_tripdata_2021-03.csv';
            ~~~
        - Query COUNT(*) on the corresponding external table(./q5/sol2_query.sql)
            ~~~
            SELECT COUNT(*) 
            FROM `kestra-de.bq_dataset.yellow_2021_03_ext`;
            ~~~

6. How would you configure the timezone to New York in a Schedule trigger? \
**Answer:** America/New_York  

    Explanation:
    - Kestra docs
        The time zone identifier (i.e. the second column in
        the Wikipedia table https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List )
        to use for evaluating the cron expression. Default value
        is the server default zone ID.