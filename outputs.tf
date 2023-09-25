output "cluster" {
  sensitive = false
  value     = local.cluster
}

output "network" {
  sensitive = false
  value     = local.network
}

output "environments" {
  sensitive = false
  value     = local.environments
}

output "services" {
  sensitive = false
  value     = local.services
}
