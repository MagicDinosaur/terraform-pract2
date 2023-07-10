variable "vpc" {
  description = "VPC name"
  type        = string
}

variable "project" {
  description = "Project ID"
  type        = string
}

variable "credentials_file" {
  description = "Path to the credentials file"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}


variable "subnets" {
  description = "Subnets configuration"
  type        = map(object({
    region = string
    cidr   = string
  }))

}

variable "firewalls" {
  description = "Firewalls configuration"
  type        = map(object({
    protocol       = string
    ports          = list(number)
    target_tags    = list(string)
    source_ranges  = list(string)
  }))
 
}

variable "memory_store_name" {
  description = "Memory store name"
  type        = string
}

variable "memory_size_gb" {
  description = "Memory store size in GB"
  type        = number
}

variable "tier" {
  description = "Memory store tier"
  type        = string
}

variable "cloud_storage_name" {
  description = "Cloud Storage bucket name"
  type        = string
}

variable "storage_class" {
  description = "Cloud Storage storage class"
  type        = string
}

variable "versioning" {
  description = "Enable versioning for Cloud Storage"
  type        = bool
}

variable "sql_name" {
  description = "SQL instance name"
  type        = string
}

variable "sql_version" {
  description = "SQL version"
  type        = string
}

variable "sql_tier" {
  description = "SQL tier"
  type        = string
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
}

variable "zone" {
  description = "GKE cluster zone"
  type        = string
}

variable "remove_default_node_pool" {
  description = "Remove default node pool in GKE"
  type        = bool
}

variable "initial_node_count" {
  description = "Initial node count in GKE"
  type        = number
}

variable "node_pool_node_count" {
  description = "Node pool node count in GKE"
  type        = number
}

variable "node_pool_machine_type" {
  description = "Node pool machine type in GKE"
  type        = string
}

