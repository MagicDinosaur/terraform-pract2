
#for vpc
variable "vpc" {
  
}

variable "project_id" {
  
}


#for subnets
variable "subnets" {
  type = map(object({
    region = string
    cidr = string
  }))
}

#for firewalls
variable "firewalls" {
  type = map(object({
    protocol = string
    ports = list(number)
    target_tags = list(string)
    source_ranges = list(string) 
  }))
}
