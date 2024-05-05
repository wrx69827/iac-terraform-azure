resource "azurerm_resource_group" "example" {
  name     = var.group
  location = var.my_area
}

resource "azurerm_storage_account" "example" {
  name                     = var.account
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.tier
  account_replication_type = var.replication_type

  tags = {
    environment = "staging"
  }
}
