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

resource "azurerm_service_plan" "example" {
  name                = var.plan
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = var.os
  sku_name            = var.sku
}

resource "azurerm_linux_function_app" "example" {
  name                = var.app
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id

  site_config {}
}

resource "azurerm_function_app_function" "example" {
  name                       = var.function
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
}
