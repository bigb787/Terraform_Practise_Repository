subscription_id = "ac4f4111-3438-4756-b884-178e3798cdc0"

environment  = "dev"
project_name = "tfpractise"
location     = "eastus"

create_resource_group = true
resource_group_name   = null # defaults to rg-tfpractise-dev

function_app_name    = null # defaults to func-tfpractise-dev
storage_account_name = null # defaults to sttfpractisedev

service_plan_sku_name = "Y1" # consumption plan — cheapest for dev
always_on             = false

enable_application_insights = true

app_settings = {
  "ASPNETCORE_ENVIRONMENT" = "Development"
}

tags = {
  environment = "dev"
  owner       = "platform-team"
  cost_center = "eng-dev"
}
