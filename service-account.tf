#Dataflow Service Account + IAM
resource "google_service_account" "dataflow_sa" {
  account_id   = "dataflow-gcs-stream-sa"
  display_name = "Dataflow GCS Streaming Service Account"
}
 
resource "google_project_iam_member" "dataflow_worker" {
  role   = "roles/dataflow.worker"
  member = "serviceAccount:${google_service_account.dataflow_sa.email}"
}
 
resource "google_project_iam_member" "dataflow_pubsub" {
  role   = "roles/pubsub.subscriber"
  member = "serviceAccount:${google_service_account.dataflow_sa.email}"
}
 
resource "google_project_iam_member" "dataflow_bq" {
  role   = "roles/bigquery.dataEditor"
  member = "serviceAccount:${google_service_account.dataflow_sa.email}"
}
 
resource "google_project_iam_member" "dataflow_storage" {
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.dataflow_sa.email}"
}