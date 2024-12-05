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

  metadata = {
    ssh-keys = <<EOT
    admin:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpJwGzB7cY46OjY54N+G6V0dLtU6EEkm1/AIbZF1a/z7yWSzxnBCEL6H9Iy0MC19AzeqtThGbMzTQ0a9hmPLgA1UUP3AsZKi0YXPc1PCNX3QlMDn6QcN/WQzgoWjEZh+AA316y1E1l1ceJCtYiDdby/ZMX16b9iCiE9P/EymiPjxquBRgxNQEeRWWiGt+bOPd3ceOdcUhpBOx+C8r2f2i2twb34SOSbMS/NA2QTRIuNgIndqYGL87xnAR01ShG+CrXbkelAhFtOS4C9lqqinwL5MTIUO8N8ITtWohywMhzzREdKfAftxh3kTviQq9N0VvfChKJSQF6kOl4F7YDQXR5CPEikjnCAFdrTGTNSZvP8NAL0yHFGfgXDJIXuONLC9UTUnEuEdTvl3kyrVaMFYaGDE+Xezeig07quisKQKvyktg58f/9+CzCTt7SEGx5dqcN3YwL+wiFZUdSdh0IGVIwJ6shzjEZiDa775Gj+SI6zyzdq48NHGNLHmfmC0ej3FE= admin
EOT
  }
  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }  
  }
