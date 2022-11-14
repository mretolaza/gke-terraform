provider "google" {
  credentials = file(var.credentials)
  project     = var.gcp_project_id
  region      = var.gcp_region
}