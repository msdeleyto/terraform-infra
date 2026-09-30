variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Top-level project / organisation name used for naming and tagging"
  type        = string
  default     = "terraform-infra"
}
