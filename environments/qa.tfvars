subscription_id = "ac4f4111-3438-4756-b884-178e3798cdc0"

environment  = "qa"
project_name = "tfpractise"
location     = "eastus"

create_resource_group = true
resource_group_name   = null # defaults to rg-tfpractise-qa

function_app_name    = null # defaults to func-tfpractise-qa
storage_account_name = null # defaults to sttfpractiseqa

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
