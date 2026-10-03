provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}

module "terraform_infra" {
  source = "./projects/terraform-infra"
}

module "gh_actions" {
  source = "./projects/gh-actions"
}
