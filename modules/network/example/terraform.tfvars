  vpc = "example-vpc"
  
  project_id = "example-project"
    subnets = {
        "us-central1" = {
        region = "us-central1"
        cidr = "10.0.0.1/28"
        },
        "us-east1" = {
        region = "us-east1"
        cidr = "10.0.0.2/28"
        }
    }
    firewalls = {
        "allow-ssh" = {
        protocol = "tcp"
        ports = [22]
        target_tags = ["ssh"]
        source_ranges = ["0.0.0.0/0"]
        },
        "allow-http" = {
        protocol = "tcp"
        ports = [80]
        target_tags = ["http"]
        source_ranges = ["0.0.0.0/0"]
        },
        "allow-https" = {
        protocol = "tcp"
        ports = [443]
        target_tags = ["https"]
        source_ranges = ["0.0.0.0/0"]
        }
    }