locals {
  project = {
    "fem-eci-project" = {
      description = "Example description of project"
    }
  }

  workspace = {
    "fem-eci-tfe" = {
      description         = "Example automation workspace for Terraform Cloud resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-tfe"
    }

    "fem-eci-github" = {
      description         = "Example automation workspace for GitHub resources."
      execution_mode      = "local"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-github"
    }

    "fem-eci-product-service-prod" = {
      description         = "Automation for product service resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-product-service"

      variables = [
        {
          category = "terraform"
          key      = "cluster_name"
          value    = "fem-eci-<your-nam>-prod"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
      ]
    }
  }
}
