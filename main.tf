module "team" {
  for_each = local.team

  source  = "ALT-F4-LLC/team/tfe"
  version = "0.2.0"

  name              = each.key
  organization_name = var.organization_name
  usernames         = each.value.usernames
}

module "project" {
  for_each = local.project

  source  = "ALT-F4-LLC/project/tfe"
  version = "0.4.0"

  description       = each.value.description
  name              = each.key
  organization_name = var.organization_name
  team_ids          = each.value.team_ids
}

module "workspace" {
  for_each = local.workspace

  source  = "ALT-F4-LLC/workspace/tfe"
  version = "0.6.0"

  description       = each.value.description
  execution_mode    = each.value.execution_mode
  name              = each.key
  organization_name = var.organization_name
  project_id        = each.value.project_id
  variables         = each.value.variables

  vcs_repo = {
    github_app_installation_id = data.tfe_github_app_installation.this.id
    identifier                 = each.value.vcs_repo_identifier
  }
}

moved {
  from = module.workspace["fem-eci-workspace"]
  to   = module.workspace["fem-eci-tfe"]
}
