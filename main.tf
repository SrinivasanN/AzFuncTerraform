# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  
  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id 
  client_id         = var.client_id
  client_secret     = var.client_secret
}

resource "azurerm_storage_account" "linux-storage-account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version = "TLS1_2"

   tags = {
    environment = "Development"
  }

}

resource "azurerm_application_insights" "FunTestFunc" {
  #name                     = "application-insights-${var.azurerm_linux_function_app}"
  name                     = var.azurerm_linux_function_app
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  application_type         = "web"
}

resource "azurerm_service_plan" "ASP-TerraformIAC-b836" {
  name                     = var.service_plan_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  os_type                  = "Linux"
  sku_name                 = "Y1"
}

resource "azurerm_linux_function_app" "linux-function-app" {
  name                     = var.azurerm_linux_function_app
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location

  service_plan_id            = azurerm_service_plan.ASP-TerraformIAC-b836.id
  storage_account_name       = azurerm_storage_account.linux-storage-account.name
  storage_account_access_key = azurerm_storage_account.linux-storage-account.primary_access_key
  https_only                 = true
  site_config {
    application_insights_key = azurerm_application_insights.FunTestFunc.instrumentation_key
    application_insights_connection_string = azurerm_application_insights.FunTestFunc.connection_string
    application_stack {
      dotnet_version = "8.0"
    }

  }
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = "${azurerm_application_insights.FunTestFunc.instrumentation_key}",
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}