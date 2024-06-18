output "storage_account_id" {
  value = azurerm_storage_account.linux-storage-account.id
}

output "service_plan_id" {
  value = azurerm_service_plan.ASP-TerraformIAC-b836.id
}

output "azurerm_application_insights_id" {
  value = azurerm_application_insights.FunTestFunc.id
}

output "azurerm_linux_function_app_id" {
  value = azurerm_linux_function_app.linux-function-app.id
}