# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role.r-squid-ecr-CodePipelineServiceRole-1U9IRLT60MSM6:
resource "aws_iam_role" "r-squid-ecr-CodePipelineServiceRole-1U9IRLT60MSM6" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "codepipeline.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  managed_policy_arns   = []
  max_session_duration  = 3600
  name                  = "squid-ecr-CodePipelineServiceRole-1U9IRLT60MSM6"
  path                  = "/"
  tags                  = {}
  tags_all              = {}

  inline_policy {
    name = "AWS-CodePipeline-Service"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "codecommit:GetBranch",
              "codecommit:GetCommit",
              "codecommit:GetUploadArchiveStatus",
              "codecommit:UploadArchive",
            ]
            Effect   = "Allow"
            Resource = aws_codecommit_repository.squid-proxy.arn
          },
          {
            Action = [
              "codebuild:BatchGetBuilds",
              "codebuild:StartBuild",
            ]
            Effect   = "Allow"
            Resource = aws_codebuild_project.squid-ecr-SquidProxyBuild.arn
          },
          {
            Action = [
              "iam:PassRole",
            ]
            Effect   = "Allow"
            Resource = aws_iam_role.r-squid-ecr-ECSTaskExecutionRole-BSNU23J2XF0S.arn
          },
          {
            Action = [
              "ecs:ListServices",
              "ecs:RegisterTaskDefinition",
              "ecs:ListTaskDefinitions",
              "ecs:DescribeTaskDefinition",
            ]
            Effect   = "Allow"
            Resource = "*"
          },
          {
            Action = [
              "ecs:DescribeServices",
              "ecs:UpdateService",
              "ecs:UpdateCluster",
            ]
            Effect = "Allow"
            "Resource" = [
              format("arn:aws:ecs:%s:%s:cluster/squid-ecr-ECSCluster", data.aws_region.current.name, data.aws_caller_identity.current.account_id),
              format("arn:aws:ecs:%s:%s:service/squid-ecr-ECSCluster/squid-ecr-ECSService-Kf9lgxSDQTcT", data.aws_region.current.name, data.aws_caller_identity.current.account_id),
            ]
          },
          {
            Action = [
              "s3:PutObject",
              "s3:GetObject",
            ]
            Effect   = "Allow"
            Resource = "arn:aws:s3:::squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k/*"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
}
