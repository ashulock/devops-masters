package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestCodePipeline(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		VarFiles:     []string{"terraform.tfvars"},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	pipelineName := terraform.Output(t, terraformOptions, "codepipeline_name")
	assert.Equal(t, "devops-masters-pipeline", pipelineName)

	codebuildProject := terraform.Output(t, terraformOptions, "codebuild_project")
	assert.Equal(t, "devops-masters-build", codebuildProject)

	codedeployApp := terraform.Output(t, terraformOptions, "codedeploy_app")
	assert.Equal(t, "devops-masters-app", codedeployApp)

	s3Bucket := terraform.Output(t, terraformOptions, "s3_bucket")
	assert.Contains(t, s3Bucket, "devops-masters-artifacts")
}