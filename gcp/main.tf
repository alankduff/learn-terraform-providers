provider "google" {
  region = "us-west1"
}

resource "google_storage_bucket" "example" {
  name     = "terraform-provider-example"
  location = "US"

  uniform_bucket_level_access = true
  force_destroy               = true
}
