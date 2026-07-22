variable "subscription_id" {
  description = "Azure subscription ID to create the state storage account in."
  type        = string
}

variable "location" {
  description = "Azure region for the state storage account."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group that will hold the state storage account."
  type        = string
  default     = "rg-tfstate"
}

variable "storage_account_name" {
  description = "Globally-unique name for the state storage account (lowercase, 3-24 chars, alphanumeric only)."
  type        = string
}

variable "container_name" {
  description = "Name of the blob container that will hold the .tfstate files."
  type        = string
  default     = "tfstate"
}
