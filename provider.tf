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
resource "google_compute_network" "default" {
  name = "my-network"
}

resource "google_compute_subnetwork" "default" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.default.self_link
}

resource "google_compute_address" "internal_with_subnet_and_address" {
  name         = "my-internal-address"
  subnetwork   = google_compute_subnetwork.default.self_link
  address_type = "INTERNAL"
  address      = "10.0.42.42"
  region       = "us-central1"
}
  metadata_startup_script = "echo hi > /test.txt"
}
