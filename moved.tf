# ── State migrations (refactor/rework_projects) ────────────────────
# These moved blocks map old resource addresses to the new nested
# module structure. Safe to remove after the first successful apply.

moved {
  from = module.terraform_infra.github_repository.this
  to   = module.terraform_infra.module.repository.github_repository.this
}

moved {
  from = module.terraform_infra.github_repository_ruleset.this
  to   = module.terraform_infra.module.repository.github_repository_ruleset.this
}

moved {
  from = module.terraform_infra.github_repository_file.renovate
  to   = module.terraform_infra.module.repository.github_repository_file.renovate
}
