vpc = "ducpham-vpc-us-nonprod"
project = "ducpham-gcp-practice"
credentials_file = "../../../credentials/ducpham-gcp-practice-4cf62598c944.json"
region = "us-central1"
zone = "us-central1-a"
# for network
subnets = {
    "us-central1-nonprod" = {
    region = "us-central1"
    cidr = "10.1.0.0/16"
    },
    "us-east1-nonprod" = {
    region = "us-east1"
    cidr = "10.2.0.0/16"
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
memory_store_name = "ducpham-memory-store-us-nonprod"
memory_size_gb = 1
tier = "BASIC"
## cloud storage
cloud_storage_name = "ducpham-cloud-storage-us-nonprod"
storage_class = "STANDARD"
versioning = false
## sql
sql_name = "ducpham-sql-us-nonprod"
sql_version = "MYSQL_5_7"
sql_tier = "db-f1-micro"

# for gke
cluster_name = "ducpham-gke-cluster-us-nonprod"

remove_default_node_pool = true
initial_node_count = 1
node_pool_node_count = 1
node_pool_machine_type = "n1-standard-1"


#for connection bw data and network module

