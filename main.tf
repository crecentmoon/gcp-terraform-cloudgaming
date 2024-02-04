terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.13.0"
    }
  }
}

provider "google" {
  project = "calovox-dev"
  region  = var.region
  zone    = "asia-northeast1-a"
}

provider "http" {}

# data "http" "my_ip" {
#   url = "http://ifconfig.me"
# }

# output "my_public_ip" {
#   value = data.http.my_ip.body
# }

# locals {
#   script_file = "./startup-script.ps1"
# }

# data "archive_file" "startup_script" {
#   type        = "ps1"
#   source_file = local.script_file
#   output_path = "startup-script.ps1"
# }