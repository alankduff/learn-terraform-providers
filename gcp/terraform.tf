terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.44.0"
    }
  }
  required_version = ">= 1.2"
}
