# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role.r-squid-ecr-ECSTaskExecutionRole-BSNU23J2XF0S:
resource "aws_iam_role" "r-squid-ecr-ECSTaskExecutionRole-BSNU23J2XF0S" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ecs-tasks.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
  ]
  max_session_duration = 3600
  name                 = "squid-ecr-ECSTaskExecutionRole-BSNU23J2XF0S"
  path                 = "/"
  tags                 = {}
  tags_all             = {}
}
