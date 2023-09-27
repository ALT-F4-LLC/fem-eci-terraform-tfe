module "project" {
  for_each = local.project

  source  = "ALT-F4-LLC/project/tfe"
  version = "0.4.0"

  description       = each.value.description
  name              = each.key
  organization_name = var.organization_name
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
}

moved {
  from = module.workspace["fem-eci-workspace"]
  to   = module.workspace["fem-eci-tfe"]
}
