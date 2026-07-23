subscription_id = "ac4f4111-3438-4756-b884-178e3798cdc0"

environment  = "prod"
project_name = "tfpractise"
location     = "eastus"

create_resource_group = true
resource_group_name   = null # defaults to rg-tfpractise-prod

function_app_name    = null # defaults to func-tfpractise-prod
storage_account_name = null # defaults to sttfpractiseprod

storage_account_replication_type = "GRS" # geo-redundant for production

service_plan_sku_name = "EP2" # premium plan sized up for production load
always_on              = true

enable_application_insights = true

app_settings = {
  "ASPNETCORE_ENVIRONMENT" = "Production"
}

tags = {
  environment = "prod"
  owner       = "platform-team"
  cost_center = "eng-prod"
}
