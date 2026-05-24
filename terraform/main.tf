terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "s3" {
  source       = "./modules/s3"
  project_name = var.project_name
}

module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

module "codebuild" {
  source            = "./modules/codebuild"
  project_name      = var.project_name
  codebuild_role_arn = module.iam.codebuild_role_arn
}

module "codedeploy" {
  source              = "./modules/codedeploy"
  project_name        = var.project_name
  codedeploy_role_arn = module.iam.codedeploy_role_arn
}

module "codepipeline" {
  source                = "./modules/codepipeline"
  project_name          = var.project_name
  github_owner          = var.github_owner
  github_repo           = var.github_repo
  github_branch         = var.github_branch
  github_token          = var.github_token
  s3_bucket             = module.s3.bucket_name
  codepipeline_role_arn = module.iam.codepipeline_role_arn
  codebuild_project_name = module.codebuild.project_name
  codedeploy_app_name   = module.codedeploy.app_name
  codedeploy_group_name = module.codedeploy.deployment_group_name
}