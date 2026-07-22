terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }

  # Uncomment and configure for shared state (recommended for any real environment).
  # backend "azurerm" {
  #   resource_group_name  = "rg-tfstate"
  #   storage_account_name = "sttfstateshared"
  #   container_name       = "tfstate"
  #   key                  = "function-app.terraform.tfstate"
  # }
}
