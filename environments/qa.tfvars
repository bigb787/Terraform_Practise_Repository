subscription_id = "00000000-0000-0000-0000-000000000000"

environment  = "qa"
project_name = "myapp"
location     = "eastus"

create_resource_group = true
resource_group_name   = null # defaults to rg-myapp-qa

function_app_name    = null # defaults to func-myapp-qa
storage_account_name = null # defaults to stmyappqa

service_plan_sku_name = "EP1" # premium plan — VNet integration / warm instances for QA
always_on              = true

enable_application_insights = true

app_settings = {
  "ASPNETCORE_ENVIRONMENT" = "QA"
}

tags = {
  environment = "qa"
  owner       = "platform-team"
  cost_center = "eng-qa"
}
