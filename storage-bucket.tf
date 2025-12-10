#GCS Bucket + Pub/Sub Notification
resource "google_storage_bucket" "source" {
  name          = var.gcs_bucket
  location      = var.region
  force_destroy = true
}
 
resource "google_pubsub_topic" "gcs_topic" {
  name = "gcs-notification-topic"
}
 
# Enable Cloud Storage → Pub/Sub notifications
resource "google_storage_notification" "gcs_events" {
  bucket         = google_storage_bucket.source.name
  topic          = google_pubsub_topic.gcs_topic.id
  event_types    = ["OBJECT_FINALIZE"]
  payload_format = "JSON_API_V1"
}