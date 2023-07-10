vpc = "ducpham-vpc-europe-nonprod"
project = "ducpham-gcp-practice"
credentials_file = "../../../credentials/ducpham-gcp-practice-4cf62598c944.json"
region = "europe-central1"
# for network
subnets = {
    "europe-central1-nonprod" = {
    region = "europe-central1"
    cidr = "10.0.0.1/28"
    },
    "europe-central1-nonprod" = {
    region = "europe-central1"
    cidr = "10.0.0.2/28"
    }
}
firewalls = {
    "allow-ssh-nonprod" = {
    protocol = "tcp"
    ports = [22]
    target_tags = ["ssh"]
    source_ranges = ["0.0.0.0/0"]
    },
    "allow-http-nonprod" = {
    protocol = "tcp"
    ports = [80]
    target_tags = ["http"]
    source_ranges = ["0.0.0.0/0"]
    },
    "allow-https-nonprod" = {
    protocol = "tcp"
    ports = [443]
    target_tags = ["https"]
    source_ranges = ["0.0.0.0/0"]
    }
}

# for data
## redis
memory_store_name = "ducpham-memory-store-Europe-nonprod"
memory_size_gb = 1
tier = "BASIC"
## cloud storage
cloud_storage_name = "ducpham-cloud-storage-Europe-nonprod"
storage_class = "STANDARD"
versioning = false
## sql
sql_name = "ducpham-sql-Europe-nonprod"
sql_version = "MYSQL_5_7"
sql_tier = "db-f1-micro"

# for compute
## instance
instance_name = "ducpham-instance-Europe-nonprod"
machine_type = "f1-micro"
zone = "europe-central1-a"
image = "debian-cloud/debian-9"
subnet_instance = "europe-central1-nonprod"
instance_startup_script =<<SCRIPT
    #!/bin/bash

    # Update the packages
    sudo apt-get update

    # Install Apache HTTP server
    sudo apt-get install -y apache2

    # Start the Apache service
    sudo service apache2 start
  SCRIPT

