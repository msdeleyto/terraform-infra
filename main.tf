provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}

module "terraform_infra" {
  source = "./terraform-infra"

  github_repo_name        = "terraform-infra"
  github_repo_description = "Infrastructure as Code — AWS, GitHub, and beyond"
  github_repo_visibility  = "public"
}
