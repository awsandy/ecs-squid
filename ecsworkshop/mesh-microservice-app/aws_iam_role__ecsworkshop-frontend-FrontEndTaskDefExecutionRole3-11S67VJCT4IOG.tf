# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role.r-ecsworkshop-frontend-FrontEndTaskDefExecutionRole3-11S67VJCT4IOG:
resource "aws_iam_role" "r-ecsworkshop-frontend-FrontEndTaskDefExecutionRole3-11S67VJCT4IOG" {
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
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
  ]
  max_session_duration = 3600
  name                 = "ecsworkshop-frontend-FrontEndTaskDefExecutionRole3-11S67VJCT4IOG"
  path                 = "/"
  tags                 = {}
  tags_all             = {}

  inline_policy {
    name = "FrontEndTaskDefExecutionRoleDefaultPolicyD4E08F77"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "logs:CreateLogStream",
              "logs:PutLogEvents",
            ]
            Effect   = "Allow"
            Resource = format("arn:aws:logs:%s:%s:log-group:ecsworkshop-frontend:*", data.aws_region.current.name, data.aws_caller_identity.current.account_id)
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
}
