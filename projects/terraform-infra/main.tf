module "repository" {
  source = "../../modules/repository"

  github_repo_name        = "terraform-infra"
  github_repo_description = "Infrastructure as Code — AWS, GitHub, and beyond"
  github_repo_visibility  = "public"
}
