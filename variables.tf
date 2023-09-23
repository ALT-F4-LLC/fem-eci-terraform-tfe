variable "organization_name" {
  default = "<your-organization-name>"
  type    = string
}

variable "organization_usernames" {
  default = ["<your-organization-username>"]
  type    = list(string)
}
