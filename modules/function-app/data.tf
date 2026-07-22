# Current Azure AD / subscription context. Useful for RBAC assignments,
# Key Vault access policies, or tagging without hardcoding tenant/subscription IDs.
data "azurerm_client_config" "current" {}

# Look up the resource group when it already exists (create_resource_group = false).
data "azurerm_resource_group" "existing" {
  count = var.create_resource_group ? 0 : 1

  name = var.resource_group_name
}
