# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.90.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "TerraformIAC"
    storage_account_name = "terraformstatestores"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
    // use_oidc             = true                                    
    // client_id            = "712e092d-c227-4652-8c02-ff3f09936c90"  
    // subscription_id      = "4f8c978f-e970-4aa0-b8fe-541521351f0b" 
    // tenant_id            = "6fcf2496-38d7-48e3-b6f3-9b52c0a92165"
  }
}
