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

