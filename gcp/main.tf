provider "google" {
  region = "us-west1"
}

provider "random" { }

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "google_storage_bucket" "example" {
  name     = "terraform-provider-${random_string.suffix.result}"
  location = "US"

  uniform_bucket_level_access = true
  force_destroy               = true
}
