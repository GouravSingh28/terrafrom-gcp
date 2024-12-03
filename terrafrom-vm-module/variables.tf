variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "zone" {
  description = "GCP Zone"
  type        = string
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "machine_type" {
  description = "Machine type (e.g., e2-medium, n1-standard-1)"
  type        = string
}

variable "disk_image" {
  description = "Source image for the boot disk"
  type        = string
}

variable "network" {
  description = "VPC network name"
  type        = string
}

variable "metadata" {
  description = "Metadata for the instance"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags for the instance"
  type        = list(string)
  default     = []
}

variable "service_account_email" {
  description = "Service account email"
  type        = string
}

variable "service_account_scopes" {
  description = "Service account scopes"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}
