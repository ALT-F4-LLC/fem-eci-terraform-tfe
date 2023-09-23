module "team" {
  source  = "ALT-F4-LLC/team/tfe"
  version = "0.2.0"

  name              = "fem-eci-team"
  organization_name = var.organization_name
  usernames         = ["<your-username>"]
}

module "project" {
  source  = "ALT-F4-LLC/project/tfe"
  version = "0.2.0"

  description       = "Example description of project"
  name              = "fem-eci-project"
  organization_name = var.organization_name
  team_name         = "fem-eci-team"
}

module "workspace" {
  source  = "ALT-F4-LLC/workspace/tfe"
  version = "0.5.0"

  description       = "Example description of workspace"
  execution_mode    = "local"
  name              = "fem-eci-workspace"
  organization_name = var.organization_name
  project_name      = "fem-eci-project"
}
