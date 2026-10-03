module "repository" {
  source = "../../modules/repository"

  github_repo_name        = "gh-actions"
  github_repo_description = "Common CI workflows and actions for other repositories"
  github_repo_visibility  = "public"
}
