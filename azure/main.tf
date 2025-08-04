provider "azurerm" {
  features {}
}

provider "random" { }

resource "azurerm_resource_group" "example" {
  name     = "terraform-provider-example"
  location = "West US 2"
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_storage_account" "example" {
  name                     = "learn-${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
