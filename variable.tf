variable "project_id" {}
variable "region" { 
default = "us-central1" 
}

variable "gcs_bucket" { 
default = "streaming-input-bucket" 
}

variable "template_bucket" { 
default = "dataflow-templates-bucket" 
}