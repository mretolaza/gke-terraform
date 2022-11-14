# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
resource "google_compute_instance" "mongo" {
  name                      = "mongodb"
  machine_type              = "e2-small"
  zone                      = var.mongo_instance_zone
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20220927"
    }
  }

  metadata_startup_script = file(var.user_data)

  network_interface {
    network    = google_compute_network.main.name
    subnetwork = google_compute_subnetwork.private_subnetwork["mongo-ip-range"].name

    access_config {
    }
  }

  tags = ["allow-ssh", "allow-gke-trafic"]
}
