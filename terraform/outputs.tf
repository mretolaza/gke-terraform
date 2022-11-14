output "mongo-nat-ip" {
  value = google_compute_instance.mongo.network_interface.0.access_config.0.nat_ip
}

output "mongo-ip" {
  value = google_compute_instance.mongo.network_interface.0.network_ip
}