# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_codebuild_project.squid-ecr-SquidProxyBuild:
resource "aws_codebuild_project" "squid-ecr-SquidProxyBuild" {
  lifecycle {
    ignore_changes = [source]
  }
  badge_enabled      = false
  build_timeout      = 60
  #encryption_key     = data.aws_kms_alias.alias_aws_s3.arn
  name               = "squid-ecr-SquidProxyBuild"
  project_visibility = "PRIVATE"
  queued_timeout     = 480
  depends_on         = [aws_iam_role.r-squid-ecr-CodeBuildServiceRole-13V9IEE48IOCX]
  service_role       = aws_iam_role.r-squid-ecr-CodeBuildServiceRole-13V9IEE48IOCX.arn
  tags               = {}
  tags_all           = {}

  artifacts {
    encryption_disabled    = false
    override_artifact_name = false
    type                   = "NO_ARTIFACTS"
  }

  cache {
    modes = []
    type  = "NO_CACHE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
    type                        = "LINUX_CONTAINER"

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      type  = "PLAINTEXT"
      value = format("%s.dkr.ecr.%s.amazonaws.com/squid-ecr-custom", data.aws_caller_identity.current.account_id, data.aws_region.current.name)
    }
    environment_variable {
      name  = "IMAGE_URI"
      type  = "PLAINTEXT"
      value = format("%s.dkr.ecr.%s.amazonaws.com/squid-ecr-custom:latest", data.aws_caller_identity.current.account_id, data.aws_region.current.name)
    }
    environment_variable {
      name  = "ECR_REPOSITORY"
      type  = "PLAINTEXT"
      value = format("%s.dkr.ecr.%s.amazonaws.com", data.aws_caller_identity.current.account_id, data.aws_region.current.name)
    }
    environment_variable {
      name  = "IMAGE_TAG"
      type  = "PLAINTEXT"
      value = "latest"
    }
    environment_variable {
      name  = "REGION"
      type  = "PLAINTEXT"
      value = "eu-west-1"
    }
    environment_variable {
      name  = "CONTAINER_NAME"
      type  = "PLAINTEXT"
      value = "squid-ecr-custom"
    }
  }

  source {
    buildspec           = <<EOT
            version: 0.2
            phases:
              pre_build:
                commands:
                   - aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_REPOSITORY
              build:
                commands:
                  - docker build -t $IMAGE_REPO_NAME:$CODEBUILD_BUILD_NUMBER .
                  - docker tag $IMAGE_REPO_NAME:$CODEBUILD_BUILD_NUMBER $IMAGE_REPO_NAME:$IMAGE_TAG
                  - printf '{"ImageURI":$IMAGE_REPO_NAME:$IMAGE_TAG}' > imageDetail.json
              post_build:
                commands:
                  - docker push $IMAGE_REPO_NAME:$CODEBUILD_BUILD_NUMBER
                  - docker push $IMAGE_REPO_NAME:$IMAGE_TAG
                  - printf '[{"name":"'$CONTAINER_NAME'","imageUri":"'$IMAGE_URI'"}]' > imageDetail.json
            artifacts:
              files:
                - imageDetail.json
        EOT
    git_clone_depth     = 0
    insecure_ssl        = false
    location            = "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/squid-proxy"
    report_build_status = false
    type                = "CODECOMMIT"
  }
}
