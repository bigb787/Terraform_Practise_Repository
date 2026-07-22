output "function_app_id" {
  description = "Resource ID of the Function App."
  value       = azurerm_windows_function_app.this.id
}

output "function_app_name" {
  description = "Name of the Function App."
  value       = azurerm_windows_function_app.this.name
}

output "function_app_default_hostname" {
  description = "Default hostname of the Function App (e.g. func-myapp-dev.azurewebsites.net)."
  value       = azurerm_windows_function_app.this.default_hostname
}

output "function_app_principal_id" {
  description = "Principal ID of the Function App's system-assigned managed identity, if enabled."
  value       = try(azurerm_windows_function_app.this.identity[0].principal_id, null)
}

output "resource_group_name" {
  description = "Name of the resource group the Function App was deployed into."
  value       = local.resource_group_id
}

output "service_plan_id" {
  description = "Resource ID of the App Service Plan."
  value       = azurerm_service_plan.this.id
}

output "storage_account_name" {
  description = "Name of the storage account backing the Function App."
  value       = azurerm_storage_account.this.name
}

output "storage_account_id" {
  description = "Resource ID of the storage account backing the Function App."
  value       = azurerm_storage_account.this.id
}

output "application_insights_instrumentation_key" {
  description = "Instrumentation key for Application Insights, if enabled."
  value       = try(azurerm_application_insights.this[0].instrumentation_key, null)
  sensitive   = true
}

output "application_insights_connection_string" {
  description = "Connection string for Application Insights, if enabled."
  value       = try(azurerm_application_insights.this[0].connection_string, null)
  sensitive   = true
}

output "current_client_tenant_id" {
  description = "Tenant ID of the caller's current Azure client configuration."
  value       = data.azurerm_client_config.current.tenant_id
}
