module "gke" {
    source = "../../../modules/gke"
    cluster_name = var.cluster_name
    zone = var.zone
    remove_default_node_pool = var.remove_default_node_pool
    initial_node_count = var.initial_node_count
    node_pool_node_count = var.node_pool_node_count
    node_pool_machine_type = var.node_pool_machine_type
}


