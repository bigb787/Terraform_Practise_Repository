subscription_id = "00000000-0000-0000-0000-000000000000"

environment  = "dev"
project_name = "myapp"
location     = "eastus"

create_resource_group = true
resource_group_name   = null # defaults to rg-myapp-dev

function_app_name    = null # defaults to func-myapp-dev
storage_account_name = null # defaults to stmyappdev

service_plan_sku_name = "Y1" # consumption plan — cheapest for dev
always_on              = false

enable_application_insights = true

app_settings = {
  "ASPNETCORE_ENVIRONMENT" = "Development"
}

tags = {
  environment = "dev"
  owner       = "platform-team"
  cost_center = "eng-dev"
}
