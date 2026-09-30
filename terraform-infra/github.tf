resource "github_repository" "this" {
  name        = var.github_repo_name
  description = var.github_repo_description
  visibility  = var.github_repo_visibility

  has_issues   = true
  has_projects = false
  has_wiki     = false

  auto_init              = false
  delete_branch_on_merge = true

  vulnerability_alerts = true
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.this.node_id
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 0
    dismiss_stale_reviews           = true
  }

  enforce_admins = false
}
