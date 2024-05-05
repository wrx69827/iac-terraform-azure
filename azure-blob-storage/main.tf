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

resource "azurerm_storage_container" "example" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.storage_name
}

resource "azurerm_storage_blob" "example" {
  name                   = var.storage_content
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = var.type
  source                 = var.source
}
