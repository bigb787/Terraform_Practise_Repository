# ---------------------------------------------------------------------------
# Bootstrap config — creates the storage account that will hold Terraform's
# remote state for the main configuration (../).
#
# This config intentionally uses LOCAL state (no backend block). It has to:
# the storage account it creates is what the main config's remote backend
# points at, so it can't depend on that same backend to manage itself.
#
# Run this once. It rarely changes after that. Keep the local
# terraform.tfstate file it produces (e.g. commit it, or store it somewhere
# safe) since it's the only record of what this config created.
# ---------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "tfstate" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    purpose    = "terraform-remote-state"
    managed_by = "terraform-bootstrap"
  }
}

resource "azurerm_storage_account" "tfstate" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  # Protects state files from accidental overwrite/deletion.
  blob_properties {
    versioning_enabled = true
  }

  tags = {
    purpose    = "terraform-remote-state"
    managed_by = "terraform-bootstrap"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}
