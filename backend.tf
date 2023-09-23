terraform {
  cloud {
    organization = "<your-organization-name>"

    workspaces {
      name = "fem-eci-workspace"
    }
  }
}
