variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform-learning-442205"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "test-vm1-us"
}

variable "machine_type" {
  description = "Machine type (e.g., e2-medium, n1-standard-1)"
  type        = string
  default     = "e2-micro" 
}

variable "disk_image" {
  description = "Source image for the boot disk"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "network" {
  description = "VPC network name"
  type        = string
  default     = "default"
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
  default     = "gouravsingh335@gmail.com"
}

variable "service_account_scopes" {
  description = "Service account scopes"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}
