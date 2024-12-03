output "vm_name" {
  description = "Name of the VM instance"
  value       = google_compute_instance.vm_instance.name
}

output "vm_self_link" {
  description = "Self-link of the VM instance"
  value       = google_compute_instance.vm_instance.self_link
}

output "vm_network_ip" {
  description = "Internal network IP of the VM instance"
  value       = google_compute_instance.vm_instance.network_interface[0].network_ip
}

output "vm_external_ip" {
  description = "External IP of the VM instance"
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}
