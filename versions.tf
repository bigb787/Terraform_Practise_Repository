terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }

  # Remote state — one shared storage account holds state for ALL environments,
  # but each environment gets its OWN file (the "key") so dev/qa/prod never
  # overwrite each other's state.
  #
  # "key" is deliberately left out here (partial backend config) because it
  # changes per environment. Supply it at init time instead:
  #
  #   terraform init -backend-config="key=dev/terraform.tfstate"
  #   terraform init -backend-config="key=qa/terraform.tfstate"
  #   terraform init -backend-config="key=prod/terraform.tfstate"
  #
  # If you switch environments in the same local folder, re-run init with the
  # new key (Terraform will offer to migrate/reconfigure — say yes).
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatekaushal01"
    container_name       = "tfstate"
  }
}
