# Terraform Infrastructure

Terraform monorepo for provisioning infrastructure across GitHub and AWS.

## Structure

```
├── main.tf                          # Provider config & module calls
├── variables.tf                     # Root variables
├── locals.tf                        # Common tags
├── outputs.tf                       # Root outputs
├── versions.tf                      # Terraform & provider versions
├── backend.tf                       # S3 remote state config
│
├── terraform-infra/                 # Module: this repo's resources
│   ├── github.tf                    # Repository & branch protection
│   ├── variables.tf                 # Module inputs
│   └── outputs.tf                   # Module outputs
│
└── .github/workflows/
    └── terraform-apply.yaml         # CI: plan & apply on push to main
```

## Usage

```bash
terraform init
terraform plan
terraform apply
```

### Adding a new project

1. Create a new module directory (e.g., `my-app/`) with `github.tf`, `variables.tf`, and `outputs.tf`.
2. Add a `module "my_app"` block in `main.tf`.
3. Add a root output in `outputs.tf`.

### Importing an existing GitHub repo

If the repo already exists, import it after `terraform init`:

```bash
terraform import 'module.my_app.github_repository.this' my-repo-name
```

## CI/CD

The workflow in `.github/workflows/terraform-apply.yaml` runs on every push to `main`:

1. Authenticates to AWS via OIDC
2. Gets a GitHub App token for the GitHub provider
3. Runs `terraform plan` then `terraform apply`

Manual runs are also supported via `workflow_dispatch`.
