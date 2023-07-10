output "instance_name" {
    value = google_compute_instance_group_manager.primary.name
}

output "instance_id" {
    value = google_compute_instance_group_manager.primary.id
}

output "instance_public_ip" {
    value = google_compute_instance_group_manager.primary.self_link
}

output "instance_zone" {
    value = google_compute_instance_group_manager.primary.zone
}

