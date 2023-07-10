
#for api activation

resource "google_project_service" "main" {
	project = var.project_id
	service = "container.googleapis.com"
	disable_dependent_services = "true"
	disable_on_destroy = false
}


# GKE resources
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count
  timeouts {
      create = "30m"
      update = "40m"
      delete = "30m"
    }

}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "preemptible-pool"
  location   = google_container_cluster.primary.location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_pool_node_count

  node_config {
    preemptible  = true
    machine_type = var.node_pool_machine_type
  }
}