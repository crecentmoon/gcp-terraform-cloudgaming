# resource "google_storage_bucket" "default" {
#   name = "game-server-bucket"
#   location = var.region
# }

# resource "google_storage_bucket_object" "default" {
#   name   = "startup-script.ps1"
#   source = "startup-script.ps1"
#   bucket = google_storage_bucket.default.name
#   content_type = "text/plain"
# }