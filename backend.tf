terraform {
  backend "s3" {
    bucket       = "terraform-github.state"
    key          = "infra/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
