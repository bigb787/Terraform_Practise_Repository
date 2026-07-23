locals {
  name_prefix = "${var.project_name}-${var.environment}"

  resource_group_name = coalesce(var.resource_group_name, "rg-${local.name_prefix}")
  function_app_name   = coalesce(var.function_app_name, "func-${local.name_prefix}")
  service_plan_name   = coalesce(var.service_plan_name, "plan-${local.name_prefix}")
  app_insights_name   = coalesce(var.application_insights_name, "appi-${local.name_prefix}")

  # Storage account names must be lowercase, alphanumeric only, <= 24 chars.
  storage_account_name = coalesce(
    var.storage_account_name,
    substr(replace("st${var.project_name}${var.environment}", "-", ""), 0, 24)
  )

  resource_group_id = var.create_resource_group ? azurerm_resource_group.this[0].name : data.azurerm_resource_group.existing[0].name
  location          = var.create_resource_group ? azurerm_resource_group.this[0].location : data.azurerm_resource_group.existing[0].location

  common_tags = merge(
    {
      environment = var.environment
      project     = var.project_name
      managed_by  = "terraform"
    },
    var.tags
  )
}

# ---------------------------------------------------------------------------
# Resource Group (optional — skip if deploying into an existing one)
# ---------------------------------------------------------------------------
resource "azurerm_resource_group" "this" {
  count = var.create_resource_group ? 1 : 0

  name     = local.resource_group_name
  location = var.location
  tags     = local.common_tags
}

# ---------------------------------------------------------------------------
# Storage Account (required by every Function App)
# ---------------------------------------------------------------------------
resource "azurerm_storage_account" "this" {
  name                     = local.storage_account_name
  resource_group_name      = local.resource_group_id
  location                 = local.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  min_tls_version          = "TLS1_2"

  tags = local.common_tags
}

# ---------------------------------------------------------------------------
# Application Insights (optional)
# ---------------------------------------------------------------------------
resource "azurerm_application_insights" "this" {
  count = var.enable_application_insights ? 1 : 0

  name                = local.app_insights_name
  resource_group_name = local.resource_group_id
  location            = local.location
  application_type    = "web"

  tags = local.common_tags
}

# ---------------------------------------------------------------------------
# App Service Plan
# ---------------------------------------------------------------------------
resource "azurerm_service_plan" "this" {
  name                = local.service_plan_name
  resource_group_name = local.resource_group_id
  location            = local.location
  os_type             = var.service_plan_os_type
  sku_name            = var.service_plan_sku_name

  tags = local.common_tags
}

# ---------------------------------------------------------------------------
# Function App (the core resource)
# ---------------------------------------------------------------------------
resource "azurerm_windows_function_app" "this" {
  name                = local.function_app_name
  resource_group_name = local.resource_group_id
  location            = local.location

  storage_account_name       = azurerm_storage_account.this.name
  storage_account_access_key = azurerm_storage_account.this.primary_access_key
  service_plan_id            = azurerm_service_plan.this.id

  https_only = var.https_only

  site_config {
    always_on         = var.always_on
    use_32_bit_worker = var.use_32_bit_worker

    application_stack {
      dotnet_version = var.dotnet_version
    }

    application_insights_key = var.enable_application_insights ? azurerm_application_insights.this[0].instrumentation_key : null
  }

  app_settings = merge(
    {
      "FUNCTIONS_WORKER_RUNTIME" = "dotnet"
      "WEBSITE_RUN_FROM_PACKAGE" = "1"
    },
    var.app_settings
  )

  identity {
    type = var.identity_type
  }

  tags = local.common_tags

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"],
    ]
  }
}
