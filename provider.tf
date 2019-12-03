provider "google" {
  credentials = "${file("model-signifier-236207-c4b54ee51f9a.json")}"
  project = "model-signifier-236207"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-project"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
  metadata_startup_script = "echo hi > /test.txt"
}
