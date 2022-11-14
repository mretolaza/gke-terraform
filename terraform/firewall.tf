resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.main.name
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh"]
}

resource "google_compute_firewall" "ingress_from_gke" {
  name = "allow-trafic-from-gke"
  allow {
    ports    = ["27017"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.main.name
  priority      = 1000
  source_ranges = [var.vpc_subnetworks["gke-ip-range"]]
  target_tags   = ["allow-gke-trafic"]
}