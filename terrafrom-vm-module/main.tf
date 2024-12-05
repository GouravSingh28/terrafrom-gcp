# Configure the Google Cloud provider
variable "google_credentials" {
  description = "Path to the GCP service account JSON file"
 }
provider "google" {
  credentials = base64decode(var.google_credentials) # Replace with your JSON key path
  project     = "terraform-learning-442205" # Replace with your GCP Project ID
  region      = "us-central1"
 }

data "google_compute_zones" "available" {
  region = var.region
 }

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = data.google_compute_zones.available.names[0]

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network = var.network
    access_config {
      # Ephemeral public IP
    }
  }

resource "google_compute_instance" "vm_instance" {
  metadata = {
    enable-oslogin = "TRUE"
  }
}

resource "google_os_login_ssh_public_key" "default" {
  user = "gouravsingh335@gmial.com" # Replace with your GCP email
  key  = file("./access-key.pub")
}

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }  
  }
