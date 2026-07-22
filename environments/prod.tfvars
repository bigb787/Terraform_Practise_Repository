subscription_id = "00000000-0000-0000-0000-000000000000"

environment  = "prod"
project_name = "myapp"
location     = "eastus"

create_resource_group = true
resource_group_name   = null # defaults to rg-myapp-prod

function_app_name    = null # defaults to func-myapp-prod
storage_account_name = null # defaults to stmyappprod

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
