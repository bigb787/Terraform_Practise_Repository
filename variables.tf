variable "subscription_id" {
  description = "Azure subscription ID to deploy into."
  type        = string
}

variable "environment" {
  description = "Environment name (dev, qa, prod). Drives which .tfvars file you use with -var-file."
  type        = string
}

variable "project_name" {
  description = "Short project/workload name used as a naming prefix (e.g. \"myapp\")."
  type        = string
}

variable "location" {
  description = "Azure region to deploy into (e.g. \"eastus\")."
  type        = string
}

variable "create_resource_group" {
  description = "Whether to create the resource group, or deploy into an existing one."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "Name of the resource group to create or look up. Defaults to a generated name when null."
  type        = string
  default     = null
}

variable "function_app_name" {
  description = "Name of the Function App. Must be globally unique. Defaults to a generated name when null."
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "Name of the storage account. Must be globally unique, lowercase, 3-24 chars. Defaults to a generated name when null."
  type        = string
  default     = null
}

variable "storage_account_tier" {
  description = "Storage account performance tier."
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Storage account replication type."
  type        = string
  default     = "LRS"
}

variable "service_plan_name" {
  description = "Name of the App Service Plan. Defaults to a generated name when null."
  type        = string
  default     = null
}

variable "service_plan_sku_name" {
  description = "SKU for the App Service Plan (e.g. \"Y1\" consumption, \"EP1\" premium)."
  type        = string
  default     = "Y1"
}

variable "dotnet_version" {
  description = ".NET version for the Function App runtime (e.g. \"v8.0\")."
  type        = string
  default     = "v8.0"
}

variable "always_on" {
  description = "Keep the Function App always on. Must be false for consumption (Y1) plans."
  type        = bool
  default     = false
}

variable "enable_application_insights" {
  description = "Whether to create Application Insights for the Function App."
  type        = bool
  default     = true
}

variable "app_settings" {
  description = "Additional application settings to merge into the Function App."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Common tags applied to all resources."
  type        = map(string)
  default     = {}
}
