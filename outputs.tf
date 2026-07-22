output "function_app_id" {
  description = "Resource ID of the Function App."
  value       = module.function_app.function_app_id
}

output "function_app_name" {
  description = "Name of the Function App."
  value       = module.function_app.function_app_name
}

output "function_app_default_hostname" {
  description = "Default hostname of the Function App."
  value       = module.function_app.function_app_default_hostname
}

output "function_app_principal_id" {
  description = "Principal ID of the Function App's managed identity."
  value       = module.function_app.function_app_principal_id
}

output "resource_group_name" {
  description = "Resource group the Function App was deployed into."
  value       = module.function_app.resource_group_name
}

output "storage_account_name" {
  description = "Name of the storage account backing the Function App."
  value       = module.function_app.storage_account_name
}

output "application_insights_connection_string" {
  description = "Connection string for Application Insights."
  value       = module.function_app.application_insights_connection_string
  sensitive   = true
}
