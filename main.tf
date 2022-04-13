resource "google_service_account" "compute_engine_service_account" {
  project      = var.projectId
  account_id   = "sa-example-app"
  display_name = "Example app service Account"
}

module "instance_template" {
  source       = "terraform-google-modules/vm/google//modules/instance_template"
  version      = "7.3.0"
  machine_type = var.machine_type
  region       = var.region
  project_id   = var.projectId
  subnetwork   = data.google_compute_subnetwork.subnetwork.self_link
  service_account = {
    email  = google_service_account.compute_engine_service_account.email
    scopes = ["compute-rw"]
  }
}

module "compute_instance" {
  source            = "terraform-google-modules/vm/google//modules/compute_instance"
  version           = "6.2.0"
  region            = var.region
  subnetwork        = data.google_compute_subnetwork.subnetwork.self_link
  num_instances     = var.num_instances
  hostname          = var.hostname
  instance_template = module.instance_template.self_link
}