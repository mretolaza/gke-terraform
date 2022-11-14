# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {
  name                    = "main"
  project                 = var.gcp_project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                     = 1500
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "private_subnetwork" {
  for_each = var.vpc_subnetworks

  name                     = each.key
  project                  = var.gcp_project_id
  ip_cidr_range            = each.value
  private_ip_google_access = true
  region                   = var.gcp_region
  network                  = google_compute_network.main.self_link
}
