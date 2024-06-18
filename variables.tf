variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "TerraformIAC"
}

variable "resource_group_location" {
  description = "Loaction of the Azure Resource Group"
  type        = string
  default     = "ukwest"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "terrafunctionstore"
}

variable "tfstate_storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "terraformstatestores"
}

variable "tfstate_storage_container_name" {
  description = "Name of the Terraform Azure Storage Account Container Name"
  type        = string
  default     = "terraformstate"
}

variable "service_plan_name" {
  description = "Name of the Azure Service Plan"
  type        = string
  default     = "ASP-TerraformIAC-b836"
}

variable "azurerm_linux_function_app"{
    description = "Name of the Azure Function App"
    type        = string
    default     = "terracodefunction"
}

