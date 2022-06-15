// Terraform Variables
variable "gcp_project" {
  description = "GCP project name"
}

variable "gcp_region" {
  description = "GCP region"
  default     = "us-east1"
}

// Google Provider Configuration
provider "google" {
  project     = var.gcp_project
  region      = var.gcp_region
}

// -------------------------------------------------------------------
// 'Insert Terraform code generated by the Configuration Designer here
// -------------------------------------------------------------------




// -------------------------------------------------------------------

// data sources
data "google_compute_subnetwork" "vpc_subnet" {
  self_link = module.network.subnets_self_links[0]
}

// Terraform outputs
output "network_name" {
  value = module.network.network_name
}

output "subnet_gateway_address" {
  value = data.google_compute_subnetwork.vpc_subnet.gateway_address
}

output "firewall_self_link" {
  value = module.network_firewall.self_link
}

output "compute_instance_addresses" {
  value = module.compute_instance.addresses
}
