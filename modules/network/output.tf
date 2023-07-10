output "network_name" {
    value = google_compute_network.main_network.name
}

output "network_id" {
    value = google_compute_network.main_network.id
}

output "network_self_link" {
    value = google_compute_network.main_network.self_link
}

# output "network_subnets" {
#     value = google_compute_subnetwork.main_subnet.*.self_link
# }

# output "network_firewalls" {
#     value = google_compute_firewall.main.*.self_link
# }

