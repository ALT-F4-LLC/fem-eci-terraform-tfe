variable "github_app_installation_id" {
  default = 0123456789 # change with GitHub installation id for Terraform Cloud
  type    = number
}

variable "github_organization_name" {
  default = "<your-github-organization-name>"
  type    = string
}

variable "organization_name" {
  default = "<your-organization-name>"
  type    = string
}
