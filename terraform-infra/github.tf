resource "github_repository" "this" {
  name        = var.github_repo_name
  description = var.github_repo_description
  visibility  = var.github_repo_visibility

  has_issues   = true
  has_projects = false
  has_wiki     = false

  auto_init              = false
  delete_branch_on_merge = true

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = true
}

resource "github_repository_ruleset" "this" {
  name        = "main"
  repository  = var.github_repo_name
  target      = "branch"
  enforcement = "active"

  bypass_actors {
    actor_id    = 4307018
    actor_type  = "Integration"
    bypass_mode = "always"
  }

  bypass_actors {
    actor_id    = 21179154
    actor_type  = "User"
    bypass_mode = "always"
  }

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    deletion            = true
    required_signatures = true
    non_fast_forward    = true

    pull_request {
      allowed_merge_methods = ["squash"]
    }

    required_status_checks {
      required_check {
        context        = "PR checks / CI Gate"
        integration_id = 15368
      }
    }
  }
}

resource "github_repository_file" "renovate" {
  repository          = var.github_repo_name
  file                = ".github/workflows/tf_renovate.yml"
  content             = file("./templates/renovate.yml")
  commit_message      = "create renovate workflow"
  overwrite_on_create = true
}
