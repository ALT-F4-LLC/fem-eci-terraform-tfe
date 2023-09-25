locals {
  network = {
    "fem-eci" = {
      azs  = ["us-west-2a", "us-west-2b"]
      cidr = "10.0.0.0/16"
    }
  }

  cluster = {
    "fem-eci-<your-name>" = {
      domain      = "<your-top-level-domain>"
      environment = "dev"
      vpc_name    = "fem-eci"
    }
  }
}
