# Azure Function App — Terraform

Reusable Terraform config for a Windows/.NET Azure Function App plus its
required dependencies (resource group, storage account, App Service Plan,
Application Insights). One module, driven by per-environment `.tfvars` files.

## Layout

```
azure-function-terraform/
├── main.tf                  # root — calls the module
├── variables.tf              # root input variables
├── outputs.tf                 # root outputs
├── providers.tf                # azurerm provider config
├── versions.tf                  # provider/Terraform version pins + backend block
├── modules/
│   └── function-app/
│       ├── main.tf            # resource group, storage, plan, App Insights, function app
│       ├── variables.tf
│       ├── outputs.tf
│       └── data.tf            # azurerm_client_config + existing-RG lookup
└── environments/
    ├── dev.tfvars
    ├── qa.tfvars
    └── prod.tfvars
```

## Usage

```bash
terraform init

# plan / apply against a specific environment
terraform plan  -var-file="environments/dev.tfvars"
terraform apply -var-file="environments/dev.tfvars"

# same commands work for qa.tfvars / prod.tfvars
terraform apply -var-file="environments/prod.tfvars"
```

Before running, edit each `environments/*.tfvars` and set a real
`subscription_id` (and adjust `project_name` / `location` / naming as needed —
`function_app_name` and `storage_account_name` must be globally unique across
Azure, so either set them explicitly or accept the generated defaults and
rename `project_name` per app).

For team use, configure remote state by uncommenting the `backend "azurerm"`
block in `versions.tf` and running `terraform init -backend-config=...` (or a
separate backend config file per environment), so each environment gets its
own state.

## Key variables

`environment`, `project_name`, `location`, `subscription_id` are required.
Everything else (SKU, replication type, always_on, app_settings, tags,
resource naming) has a sensible default and can be overridden per
environment — see `variables.tf` for the full list and descriptions.

## Notes

- `service_plan_sku_name = "Y1"` is the consumption plan; `always_on` must
  stay `false` on Y1. Switch to `EP1`/`EP2`/`B1` etc. for premium/dedicated
  plans, which support `always_on = true`.
- Set `create_resource_group = false` and provide `resource_group_name` to
  deploy into a resource group that already exists instead of creating one.
- The Function App has a system-assigned managed identity enabled by
  default (`identity_type`), exposed via the `function_app_principal_id`
  output for RBAC/Key Vault access policy assignments.
