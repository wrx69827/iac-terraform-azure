resource "azurerm_function_app_function_id" "example" {
  name = "id"
  function_app_id = azurerm_function_app_function.example.id
}
