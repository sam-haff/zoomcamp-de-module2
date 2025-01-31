# Module 2. Solutions

## Kestra
  **GCP compute instance** is used to host **Kestra**. **Terraform** is used for the allocation of all the required resources on the GCP.
All the **.tf** files can be found in the <em>./terraform</em> directory.\
   **Kestra flows** are delivered to the GCP Kestra instance by means of the GitHub Actions workflows(**./.github** folder).\
The Kestra flows are in the **./kestra/flows** directory. Flows with the **\*gcp\*** in the filename are the only ones that are actually used and work in the cloud environment, others rely on the PG instance and are there only for reference.

## Module Questions
  The answers along with the explanation are in the **./answers** folder. The required data was ingested using backfill execution, as was suggested by the hint in the Module task.
