#This emits a Pub/Sub message every time a file is created in the bucket.
#BigQuery Dataset + Table

resource "google_bigquery_dataset" "dataset" {
  dataset_id = "gcs_streaming"
  location   = "US"
}
 
resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = "ingested_data"
 
  schema = jsonencode([
    { name = "filename", type = "STRING", mode = "NULLABLE" },
    { name = "size",     type = "INTEGER", mode = "NULLABLE" },
    { name = "content",  type = "STRING", mode = "NULLABLE" }
  ])
}
