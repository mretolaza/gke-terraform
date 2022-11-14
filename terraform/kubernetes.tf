# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "gke" {
  name     = var.gke_cluster_name
  location = var.gcp_region
  project  = var.gcp_project_id

  network    = google_compute_network.main.name
  subnetwork = google_compute_subnetwork.private_subnetwork["gke-ip-range"].name

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }
}

resource "google_container_node_pool" "general" {
  name       = "general"
  location   = var.gcp_region
  cluster    = google_container_cluster.gke.name
  project    = var.gcp_project_id
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    labels = {
      role = "general"
    }
    machine_type = "e2-small"

    service_account = var.gke_service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}