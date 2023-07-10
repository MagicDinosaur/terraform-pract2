#for redis
variable "memory_store_name" {
    type = string
    default = "main-cache"
}

variable "memory_size_gb" {
    type = number
    default = 1
}

variable "tier" {
    type = string
    default = "BASIC"
}

variable "region" {
    type = string
    default = "us-west1"
}
variable "zone" {
  
}

variable "vpc" {
}

#for cloud storage

variable "cloud_storage_name" {
    type = string
    default = "main-cloud-storage"
}
  
variable "storage_class" {
    type = string
    default = "STANDARD"
}

variable "versioning" {
    type = bool
    default = false
}

#for cloud sql

variable "sql_name" {
    type = string
    default = "main-sql"
}

variable "sql_version" {
    type = string
    default = "MYSQL_5_7"
}

variable "sql_tier" {
    type = string
    default = "db-f1-micro"
}

# variable "network_resource" {
#   description = "Reference to the network resource from the network module"
#   type        = object({
#     name = string
#     id   = string
#   })
# }

variable "network_id" {
    type = string
}

variable "project_id"{

}