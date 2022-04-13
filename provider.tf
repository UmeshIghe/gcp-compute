terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.61"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.61"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 2.3"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-example-foundation:app_env_base/v2.3.1"
  }

  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-example-foundation:app_env_base/v2.3.1"
  }

}

provider "google" {
  project = "LeTestProject"
  # region  = "us-central1"
  # zone    = "us-central1-c"
}