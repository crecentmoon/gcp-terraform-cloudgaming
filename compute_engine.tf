resource "google_compute_instance" "game_server" {
  name         = "game-server"
  machine_type = "e2-highmem-8"

  boot_disk {
    auto_delete = false
    initialize_params {
      image = "windows-server-2019-dc-v20200908"
      size  = 100
    }
  }

  attached_disk {
    source = "${google_compute_disk.game_disk.id}"
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  scheduling {
    preemptible       = false
    on_host_maintenance = "MIGRATE"
    automatic_restart = true
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  # guest_accelerator {
  #   type  = "nvidia-tesla-t4"
  #   count = 1
  #   // enable evidia grid
  # }

  # https://cloud.google.com/compute/docs/instances/startup-scripts/windows?hl=ja#api
  # metadata = {
  #   windows-startup-script-url = "gs://${google_storage_bucket.default.name}/startup-script.ps1"
  # }

  tags = ["game-server", "windows"]
}

resource "google_compute_disk" "game_disk" {
  name  = "game-disk"
  type  = "pd-ssd"
  zone  = "asia-northeast1-a"
  size  = 250 # Size in GB
  image = "windows-server-2019-dc-v20200908"
}

resource "google_compute_firewall" "parsec_firewall" {
  name    = "parsec-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["3389", "8000-8010"] # RDPとParsec用のポート
  }

  source_ranges = ["0.0.0.0/0"] # note: this allows access from the internet, if you want to restrict access, you should change this to a more specific range
  target_tags   = ["game-server"]
}

resource "google_compute_firewall" "rdp_firewall" {
  name    = "rdp-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["3389"] # RDP用のポート
  }

  source_ranges = ["0.0.0.0/0"] # note: this allows access from the internet, if you want to restrict access, you should change this to a more specific range
  target_tags   = ["game-server"]
}

# resource "google_compute_firewall" "allow_my_ip" {
#   name    = "allow-my-ip"
#   network = "default"

#   allow {
#     protocol = "tcp"
#     ports    = ["22", "3389"] # SSHとRDPへのアクセスを許可
#   }

#   source_ranges = [data.http.my_ip.body]
# }
