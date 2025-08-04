terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.45.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.2"
    }
  }
  required_version = ">= 1.2"
}
