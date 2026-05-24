variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "devops-masters-2025"
}

variable "github_owner" {
  description = "Your GitHub username"
}

variable "github_repo" {
  description = "Your GitHub repo name"
  default     = "devops-masters"
}

variable "github_branch" {
  default = "main"
}

variable "github_token" {
  description = "Your GitHub personal access token"
  sensitive   = true
}