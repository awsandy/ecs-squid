# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role.r-squid-ecr-CodeBuildServiceRole-13V9IEE48IOCX:
resource "aws_iam_role" "r-squid-ecr-CodeBuildServiceRole-13V9IEE48IOCX" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "codebuild.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  managed_policy_arns   = []
  max_session_duration  = 3600
  name                  = "squid-ecr-CodeBuildServiceRole-13V9IEE48IOCX"
  path                  = "/"
  tags                  = {}
  tags_all              = {}

  inline_policy {
    name = "CB"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "codebuild:CreateReportGroup",
              "codebuild:CreateReport",
              "Codebuild:UpdateReport",
              "codebuild:BatchPutTestCases",
              "codebuild:BatchPutCodeCoverages",
            ]
            Effect = "Allow"
            "Resource" = [
              format("arn:aws:codebuild:%s:%s:report-group/squid-ecr-SquidProxyBuild-*", data.aws_region.current.name, data.aws_caller_identity.current.account_id),
            ]
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
  inline_policy {
    name = "CC"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "codecommit:GitPull",
            ]
            Effect = "Allow"
            "Resource" = [
              format("arn:aws:codecommit:%s:%s:squid-proxy", data.aws_region.current.name, data.aws_caller_identity.current.account_id),
            ]
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
  inline_policy {
    name = "CW"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents",
            ]
            Effect   = "Allow"
            Resource = format("arn:aws:logs:%s:%s:log-group:/aws/codebuild/squid-ecr-*", data.aws_region.current.name, data.aws_caller_identity.current.account_id)
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
  inline_policy {
    name = "ECR"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "ecr:PutImage",
              "ecr:InitiateLayerUpload",
              "ecr:UploadLayerPart",
              "ecr:CompleteLayerUpload",
              "ecr:BatchCheckLayerAvailability",
            ]
            Effect = "Allow"
            "Resource" = [
              format("arn:aws:ecr:%s:%s:repository/squid-ecr-ecrrepository", data.aws_region.current.name, data.aws_caller_identity.current.account_id),
            ]
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
  inline_policy {
    name = "ECRAuth"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "ecr:GetAuthorizationToken",
            ]
            Effect   = "Allow"
            Resource = "*"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
  inline_policy {
    name = "PipelineS3"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "s3:PutObject",
              "s3:GetObject",
              "s3:GetObjectVersion",
              "s3:GetBucketAcl",
              "s3:GetBucketLocation",
            ]
            Effect = "Allow"
            "Resource" = [
              format("%s*",aws_s3_bucket.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k.arn),
              #"arn:aws:s3:::squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k*",
            ]
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
}
