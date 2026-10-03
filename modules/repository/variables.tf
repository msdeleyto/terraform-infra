variable "github_repo_name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "github_repo_description" {
  description = "Description of the GitHub repository"
  type        = string
}

variable "github_repo_visibility" {
  description = "Repository visibility (public or private)"
  type        = string
}

variable "required_status_checks" {
  description = "List of required status checks to enforce on the main branch ruleset"
  type = list(object({
    context        = string
    integration_id = number
  }))
  default = []
}
