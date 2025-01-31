# Module 2. Solutions

## Kestra
   **Kestra** is hosted on the **GCP compute instance**. Allocation of the GCP resources is done with the help of **Terraform**. 
All the **.tf** files can be found in the <em>./terraform</em> directory.\
   **docker-compose.yml** for the **Kestra** instance is in the <em>./terraform</em> dir. \
   **Kestra flows** are delivered to the GCP **Kestra** instance by means of the **GitHub Actions workflows**(<em> ./.github</em> folder).\
The Kestra flows are in the <em>./kestra/flows</em> directory. Flows with the <em>\*gcp\*</em> in the filename are the only ones that are actually used and work in the **cloud environment**, others rely on the PG instance and are there only for reference.

## Module Questions
  The answers along with the explanation are in the <em>./answers</em> folder. The required data was ingested using backfill execution, as was suggested by the hint in the Module task.
