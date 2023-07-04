# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role_policy.r-squid-ecr-CodeCommitChangeEventRole-1P8MCPP7TNO11__cwe-pipeline-execution:
resource "aws_iam_role_policy" "r-squid-ecr-CodeCommitChangeEventRole-1P8MCPP7TNO11__cwe-pipeline-execution" {
  name = "cwe-pipeline-execution"
  policy = jsonencode(
    {
      Statement = [
        {
          Action   = "codepipeline:StartPipelineExecution"
          Effect   = "Allow"
          Resource = aws_codepipeline.r-squid-ecr-SquidProxy-CodeCommitEvents-pipeline.arn
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.r-squid-ecr-CodeCommitChangeEventRole-1P8MCPP7TNO11.id
}