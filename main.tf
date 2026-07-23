module "function_app" {
  source = "./modules/function-app"

  environment           = var.environment
  project_name          = var.project_name
  location              = var.location
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name

  function_app_name                = var.function_app_name
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  service_plan_name     = var.service_plan_name
  service_plan_os_type  = "Windows"
  service_plan_sku_name = var.service_plan_sku_name

  dotnet_version = var.dotnet_version
  always_on      = var.always_on

  enable_application_insights = var.enable_application_insights
  app_settings                = var.app_settings

  tags = var.tags
}
