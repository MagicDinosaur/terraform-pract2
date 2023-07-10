
#for api activation

resource "google_project_service" "main" {
	project = var.project_id
	service = "compute.googleapis.com"
	disable_dependent_services = "true"
	disable_on_destroy = false
}

# network resources

resource "google_compute_network" "main_network" {
    name = var.vpc
    auto_create_subnetworks = false
    project = var.project_id
}

resource "google_compute_subnetwork" "main_subnet" {
    for_each = var.subnets
    name = "${var.vpc}-subnet-${each.key}"
    region = each.value.region
    ip_cidr_range = each.value.cidr
    network = google_compute_network.main_network.self_link
    project = var.project_id
} 


resource "google_compute_firewall" "main" {
    for_each = var.firewalls
    name = "${var.vpc}-firewall-${each.key}"
    network = google_compute_network.main_network.self_link
    project = var.project_id
    allow {
        protocol = each.value.protocol
        ports = each.value.ports
    }

    target_tags = each.value.target_tags
    source_ranges = each.value.source_ranges



}