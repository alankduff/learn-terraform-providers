provider "azurerm" {
  storage_use_azuread = true

  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-provider-example"
  location = "West US 2"
}

resource "azurerm_storage_account" "example" {
  name                     = "terraformproviderexample"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
