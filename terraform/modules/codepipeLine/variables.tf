variable "project_name" {
  description = "Project name"
}

variable "github_owner" {
  description = "GitHub username"
}

variable "github_repo" {
  description = "GitHub repo name"
}

variable "github_branch" {
  description = "GitHub branch name"
}

variable "github_token" {
  description = "GitHub personal access token"
  sensitive   = true
}

variable "s3_bucket" {
  description = "S3 bucket name for artifacts"
}

variable "codepipeline_role_arn" {
  description = "IAM role ARN for CodePipeline"
}

variable "codebuild_project_name" {
  description = "CodeBuild project name"
}

variable "codedeploy_app_name" {
  description = "CodeDeploy application name"
}

variable "codedeploy_group_name" {
  description = "CodeDeploy deployment group name"
}