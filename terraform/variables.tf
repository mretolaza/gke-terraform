variable "credentials" {
  type        = string
  description = "Location of service account for GCP"
}

variable "gcp_project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "gcp_region" {
  type        = string
  description = "GCP Region"
}

variable "mongo_instance_zone" {
  type        = string
  description = "Mongo instance"
}

variable "gke_cluster_name" {
  type        = string
  description = "GKE cluster name"
}

variable "gke_availabilty_zones" {
  type        = list(string)
  description = "GKE Availability zones"
}

variable "gke_regional" {
  type        = bool
  description = "GKE regional or not"
}

variable "vpc_name" {
  type        = string
  description = "VPC network name"
}

variable "vpc_subnetworks" {
  type        = map(any)
  description = "VPC subnetwork name and range"
}

# variable "gke_subnetwork" {
#   type        = string
#   description = "Subnetwork name"
# }

variable "gke_node_pool_name" {
  type        = string
  description = "GKE node pool name"
}

variable "gke_service_account" {
  type        = string
  description = "GKE Service account"
}

variable "mongo_ssh_key" {
  type = object({
    user = string,
    file = string
  })
}

variable "user_data" {
  type        = string
  description = "Mongo installation ssh"
}
