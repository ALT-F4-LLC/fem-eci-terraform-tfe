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
      description    = "Example automation workspace for Terraform Cloud resources."
      execution_mode = "local"
      project_id     = module.project["fem-eci-project"].id
    }
  }
}
