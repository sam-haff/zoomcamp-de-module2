provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = file(var.credentials_file)
}
provider "google-beta" {
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = file(var.credentials_file)
}
resource "google_storage_bucket" "data-bucket" {
  name          = var.gcs_storage_name
  location      = var.location
  force_destroy = true
  storage_class = var.gcs_storage_class

  uniform_bucket_level_access = true
}
resource "google_storage_bucket" "kestra-storage-bucket" {
  name          = var.gcs_kestra_storage_name
  location      = var.location
  force_destroy = true
  storage_class = var.gcs_kestra_storage_class

  uniform_bucket_level_access = true
}
resource "google_bigquery_dataset" "data-dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
  delete_contents_on_destroy = true
}

resource "google_compute_instance" "kestra-inst" {

  depends_on = [google_service_networking_connection.db_private_vpc_connection]

tags = ["http-server","https-server"]
  allow_stopping_for_update = true
  desired_status = "RUNNING" # switch to "TERMINATED" to stop

  boot_disk {
    auto_delete = true
    device_name = "kestra-inst"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20250128"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-standard-2"
  name         = "kestra-inst"

  
  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
   // network = google_compute_network.private_network.self_link//
    subnetwork = data.google_compute_subnetwork.default.id //"projects/kestra-de/regions/us-central1/subnetworks/default" //google_compute_subnetwork.private_subnetwork.id
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "zoomcamp-2@kestra-de.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  //tags = ["https-server"]
  zone = var.zone
}
