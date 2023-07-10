module "network" {
    source = "../../../modules/network"
    project_id = var.project
    vpc = var.vpc
    subnets = var.subnets
    firewalls = var.firewalls
}


module "data" {
    source = "../../../modules/data"
    memory_store_name = var.memory_store_name
    memory_size_gb = var.memory_size_gb
    tier = var.tier
    region = var.region
    zone = var.zone
    vpc = var.vpc
    cloud_storage_name = var.cloud_storage_name
    storage_class = var.storage_class
    versioning = var.versioning
    sql_name = var.sql_name
    sql_version = var.sql_version
    sql_tier = var.sql_tier
    network_id   = module.network.network_id
    project_id = var.project
}

module "gke" {
    source = "../../../modules/gke"
    cluster_name = var.cluster_name
    zone = var.zone
    remove_default_node_pool = var.remove_default_node_pool
    initial_node_count = var.initial_node_count
    node_pool_node_count = var.node_pool_node_count
    node_pool_machine_type = var.node_pool_machine_type
    project_id = var.project
}


