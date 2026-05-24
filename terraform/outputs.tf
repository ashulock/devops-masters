output "codepipeline_name" {
  value = module.codepipeline.pipeline_name
}

output "codebuild_project" {
  value = module.codebuild.project_name
}

output "codedeploy_app" {
  value = module.codedeploy.app_name
}

output "s3_bucket" {
  value = module.s3.bucket_name
}