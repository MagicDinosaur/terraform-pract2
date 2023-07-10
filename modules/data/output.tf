output "memorystore-name" {
    value = google_redis_instance.main_cache.name
}
output "memorystore-id" {
    value = google_redis_instance.main_cache.id
}
  
output "memorystore-host" {
    value = google_redis_instance.main_cache.host
}

output "memorystore-port" {
    value = google_redis_instance.main_cache.port
}

output "memorystore-region" {
    value = google_redis_instance.main_cache.region
}



