module "network" {
    source = "../../../modules/network"
    name = "example"
    project_id = var.project_id
    vpc = var.vpc
    subnets = var.subnets
    firewalls = var.firewalls

}