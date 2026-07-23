terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }

  # Terraform Cloud (workspace: Terraform_Practise_Repository) tracks state
  # and run history. Runs are triggered from this local machine via the
  # normal `terraform plan`/`apply` commands (CLI-driven workflow), so
  # -var-file works exactly as normal.
  #
  # REQUIRED one-time setting: on the workspace's Settings > General page,
  # set "Execution Mode" to "Local" (not "Remote"). Local execution mode
  # means Terraform runs using YOUR machine's `az login` session; Terraform
  # Cloud just records the run and stores the state file. If left on
  # "Remote", Terraform Cloud would try to run this on its own servers,
  # which has no access to your local Azure CLI login.
  cloud {
    organization = "DemoOrgPersonal"

    workspaces {
      name = "Terraform_Practise_Repository"
    }
  }
}
