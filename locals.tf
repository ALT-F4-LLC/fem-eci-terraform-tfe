locals {
  team = {
    "fem-eci-team" = {
      usernames = var.organization_usernames
    }
  }

  project = {
    "fem-eci-project" = {
      description = "Example description of project"
      team_ids    = [module.team["fem-eci-team"].id]
    }
  }

  workspace = {
    "fem-eci-tfe" = {
      description         = "Example automation workspace for Terraform Cloud resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-tfe"
    }
  }
}
