output "cluster_name" {
    value = google_container_cluster.primary.name
}

output "cluster_id" {
    value = google_container_cluster.primary.id
}

output "cluster_endpoint" {
    value = google_container_cluster.primary.endpoint
}

output "cluster_self_link" {
    value = google_container_cluster.primary.self_link
}

