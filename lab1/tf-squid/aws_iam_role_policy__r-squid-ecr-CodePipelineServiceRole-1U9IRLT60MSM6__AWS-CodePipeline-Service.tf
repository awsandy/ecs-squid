# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role_policy.r-squid-ecr-CodePipelineServiceRole-1U9IRLT60MSM6__AWS-CodePipeline-Service:
resource "aws_iam_role_policy" "r-squid-ecr-CodePipelineServiceRole-1U9IRLT60MSM6__AWS-CodePipeline-Service" {
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
          Resource = [
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
          Resource=format("%s/*",aws_s3_bucket.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k.arn),
          #Resource = "arn:aws:s3:::squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k/*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.r-squid-ecr-CodePipelineServiceRole-1U9IRLT60MSM6.id
}
