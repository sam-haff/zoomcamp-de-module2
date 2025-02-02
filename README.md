# Module 2. Solutions

## Kestra
   **Kestra** is deployed using **GCP compute engine**. Allocation of GCP resources is done with **Terraform**. 
All the **.tf** files can be found in the <em>./terraform</em> directory.\
   **docker-compose.yml** for the **Kestra** instance is in the <em>./terraform</em> dir. \
   **Kestra flows** are delivered to the GCP **Kestra** instance by means of the **GitHub Actions workflows**(<em> ./.github</em> folder).\
The Kestra flows are in the <em>./kestra/flows</em> directory. Flows with the <em>\*gcp\*</em> in a filename are the only ones that are actually used and work in **cloud environment**, others rely on the Postgres instance and are there only for a reference.

## Flows
- **ingest_taxi_data_flow_gcp_select** - ingests data for the selected month of the selected year(both are the inputs).
- **ingest_taxi_data_flow_gcp_schedule** - ingests data o automtically on the regular basis using <schedule> triggers.
- **ingest_taxi_data_flow_gcp_foreach_range** - ingests data from selected taxis and dates range. Leverages <ForEach> tasks and Pebble templating language to generate date values which are used for the iteration. 
- **ingest_taxi_data_flow_gcp_foreach** - ingests data for selected taxis, months and years, ingestion happens over all the combinations of the input values. Leverages <ForEach> tasks for traversing the combinations of the input values.
- **ingest_taxi_data_flow_gcp_foreach_truncate2021** - same as ingest_taxi_data_flow_gcp_foreach_range, but excludes 2021 months after July to avoid failing on the non-existing data.

## Module Questions
  The answers along with the explanation are in the <em>./answers</em> folder. The required data was ingested using backfill execution, as was suggested by the hint in the Module task.
