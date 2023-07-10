module "network" {
    source = "../../../modules/network"
    project_id = var.project_id
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
    vpc = var.vpc
    cloud_storage_name = var.cloud_storage_name
    storage_class = var.storage_class
    versioning = var.versioning
    sql_name = var.sql_name
    sql_version = var.sql_version
    sql_tier = var.sql_tier
}

module "instance" {
    source = "../../../modules/instance"
    instance_name = var.instance_name
    machine_type = var.machine_type
    zone = var.zone
    image = var.image
    vpc = var.vpc
    subnet = var.subnet_instance
    instance_startup_script = var.instance_startup_script



}




#   name         = var.instance_name
#   machine_type = var.machine_type
#   zone         = var.zone
#   boot_disk {
#     initialize_params {
#       image = var.image
#     }
#   }
#   network_interface {
#     network = var.vpc
#     subnetwork = var.subnet
#     access_config {
#     }
#   }
#     metadata_startup_script = var.instance_startup_script

