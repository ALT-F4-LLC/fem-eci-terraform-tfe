module "project" {
  for_each = local.project

  source  = "ALT-F4-LLC/project/tfe"
  version = "0.4.0"

  description       = each.value.description
  name              = each.key
  organization_name = var.organization_name
}

module "workspace" {
  for_each = merge(
    local.workspace,
    local.workspace_aws
  )

  source  = "ALT-F4-LLC/workspace/tfe"
  version = "0.6.0"

  description       = each.value.description
  execution_mode    = each.value.execution_mode
  name              = each.key
  organization_name = var.organization_name
  project_id        = each.value.project_id
  variables         = try(each.value.variables, [])

  vcs_repo = {
    github_app_installation_id = data.tfe_github_app_installation.this.id
    identifier                 = each.value.vcs_repo_identifier
  }
}

moved {
  from = module.workspace["fem-eci-aws-cluster-prod"]
  to   = module.workspace["fem-eci-test-aws-cluster-prod"]
}
