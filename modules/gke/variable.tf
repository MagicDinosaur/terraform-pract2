
# for cluster

variable "project_id" {
  
}

variable "cluster_name" {
  
}
variable "zone" {
  
}

variable "remove_default_node_pool" {
    default = true
}

variable "initial_node_count" {
    default = 1
}
# for node pool
variable "node_pool_node_count" {
    default = 1
}

variable "node_pool_machine_type" {
    default = "n1-standard-1"
}


