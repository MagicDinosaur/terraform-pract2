
# for data api
module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.2"

  project_id                  = var.project_id
  
  activate_apis = [
        "cloudresourcemanager.googleapis.com",
        "redis.googleapis.com",
        "sqladmin.googleapis.com",
        "servicenetworking.googleapis.com",
        "sql-component.googleapis.com",
  ]
}



#memorystore redis

resource "google_redis_instance" "main_cache" {
    name = var.memory_store_name
    memory_size_gb = var.memory_size_gb
    location_id = var.zone
    tier = var.tier
    authorized_network = var.vpc

}

#for cloud storage

resource "google_storage_bucket" "main_cloud_storage" {
    name = var.cloud_storage_name
    location = var.region
    storage_class = var.storage_class
    force_destroy = true
    # project = var.project_id
    uniform_bucket_level_access = true
    versioning {
        enabled = var.versioning
    }
    lifecycle_rule {
        action {
            type = "SetStorageClass"
            storage_class = "REGIONAL"
        }
        condition {
            age = 1
        }
    }
}


#for cloud sql

resource "google_sql_database_instance" "main_sql" {
    name             = var.sql_name
    database_version = var.sql_version
    region           = var.region
    depends_on = [google_service_networking_connection.private_vpc_connection]
    deletion_protection = false
    settings {
        tier = var.sql_tier
        ip_configuration {
        ipv4_enabled                                  = false
        # private_network                               = data.google_compute_network.main_network.id
        private_network                               = var.network_id
        enable_private_path_for_google_cloud_services = true
        }
    }
}
# for network peering
# data "google_compute_network" "main_network" {
#   name = var.network_resource.name
#   id = var.network_resource.network_id
# }

resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
#   network       = data.google_compute_network.main_network.id
    network       = var.network_id
}

resource "google_service_networking_connection" "private_vpc_connection" {
#   network                 = data.google_compute_network.main_network.id
    network                 = var.network_id
    service                 = "servicenetworking.googleapis.com"
    reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}
