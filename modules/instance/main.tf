resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  network_interface {
    network = var.vpc
    subnetwork = var.subnet_instance
    access_config {
    }
  }
    metadata_startup_script = var.instance_startup_script


}
