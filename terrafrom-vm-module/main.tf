# Configure the Google Cloud provider
provider "google" {
  credentials = file("./terraform-learning-442205-285cdadbd32c.json") # Replace with your JSON key path
  project     = "terraform-learning-442205"                            # Replace with your GCP Project ID
  region      = "us-central1"
}


resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

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

  metadata = var.metadata
  tags     = var.tags

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }
}
