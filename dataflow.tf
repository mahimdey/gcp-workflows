#Dataflow Flex Template Job
#Assuming your Flex template JSON is uploaded to GCS :gs://<template_bucket>/gcs_to_bq_template.json

resource "google_dataflow_flex_template_job" "job" {
  name                     = "gcs-stream-to-bq"
  region                   = var.region
  container_spec_gcs_path  = "gs://${var.template_bucket}/gcs_to_bq_template.json"
 
  parameters = {
    inputSubscription = "projects/${var.project_id}/subscriptions/gcs-event-sub"
    outputTable       = "${var.project_id}:gcs_streaming.ingested_data"
    tempLocation      = "gs://${var.template_bucket}/temp/"
    stagingLocation   = "gs://${var.template_bucket}/staging/"
    inputBucket       = google_storage_bucket.source.url
  }
 
  service_account_email = google_service_account.dataflow_sa.email
}