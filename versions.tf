terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }

  # Terraform Cloud manages state and runs for this config — no Azure
  # storage account needed for state anymore. Replace "your-org-name" and
  # "your-workspace-name" with the values from your Terraform Cloud
  # organization/workspace (app.terraform.io).
  #
  # Since Terraform Cloud VCS-driven runs don't accept a -var-file flag,
  # create ONE workspace per environment (e.g. func-app-dev, func-app-qa,
  # func-app-prod), each pointed at this same repo, and enter that
  # environment's variables directly in each workspace's "Variables" tab
  # (copy the values from the matching environments/*.tfvars file) instead
  # of relying on the tfvars files for cloud-driven runs.
  cloud {
    organization = "DemoOrgPersonal"

    workspaces {
      name = "Terraform_Practise_Repository"
    }
  }
}
