variable "environment" {
  description = "Environment name (e.g. dev, qa, prod). Used in resource naming and tags."
  type        = string

  validation {
    condition     = contains(["dev", "qa", "prod"], lower(var.environment))
    error_message = "environment must be one of: dev, qa, prod."
  }
}

variable "project_name" {
  description = "Short project/workload name used as a naming prefix for all resources (e.g. \"myapp\")."
  type        = string
}

variable "location" {
  description = "Azure region to deploy into (e.g. \"eastus\")."
  type        = string
}

variable "create_resource_group" {
  description = "Whether this module should create the resource group. Set to false to deploy into an existing resource group referenced by resource_group_name."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "Name of the resource group to create (create_resource_group = true) or look up (create_resource_group = false). Defaults to a generated name when null."
  type        = string
  default     = null
}

variable "function_app_name" {
  description = "Name of the Function App. Must be globally unique. Defaults to a generated name when null."
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "Name of the storage account backing the Function App. Must be globally unique, lowercase, 3-24 chars. Defaults to a generated name when null."
  type        = string
  default     = null
}

variable "storage_account_tier" {
  description = "Storage account performance tier."
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Storage account replication type (LRS, GRS, ZRS, RAGRS, etc.)."
  type        = string
  default     = "LRS"
}

variable "service_plan_name" {
  description = "Name of the App Service Plan. Defaults to a generated name when null."
  type        = string
  default     = null
}

variable "service_plan_os_type" {
  description = "OS type for the App Service Plan (Windows or Linux)."
  type        = string
  default     = "Windows"

  validation {
    condition     = contains(["Windows", "Linux"], var.service_plan_os_type)
    error_message = "service_plan_os_type must be either \"Windows\" or \"Linux\"."
  }
}

variable "service_plan_sku_name" {
  description = "SKU for the App Service Plan (e.g. \"Y1\" consumption, \"EP1\" premium, \"B1\" basic)."
  type        = string
  default     = "Y1"
}

variable "dotnet_version" {
  description = ".NET version for the Function App runtime (e.g. \"v8.0\")."
  type        = string
  default     = "v8.0"
}

variable "use_32_bit_worker" {
  description = "Whether to use a 32-bit worker process. Set to false for larger workloads / 64-bit."
  type        = bool
  default     = false
}

variable "always_on" {
  description = "Keep the Function App always on. Must be false for consumption (Y1) plans."
  type        = bool
  default     = false
}

variable "https_only" {
  description = "Force HTTPS-only traffic to the Function App."
  type        = bool
  default     = true
}

variable "enable_application_insights" {
  description = "Whether to create an Application Insights instance for the Function App."
  type        = bool
  default     = true
}

variable "application_insights_name" {
  description = "Name of the Application Insights instance. Defaults to a generated name when null."
  type        = string
  default     = null
}

variable "app_settings" {
  description = "Additional application settings (key/value pairs) to merge into the Function App."
  type        = map(string)
  default     = {}
}

variable "identity_type" {
  description = "Managed identity type for the Function App (SystemAssigned, UserAssigned, or SystemAssigned, UserAssigned)."
  type        = string
  default     = "SystemAssigned"
}

variable "tags" {
  description = "Common tags applied to all resources created by this module."
  type        = map(string)
  default     = {}
}
