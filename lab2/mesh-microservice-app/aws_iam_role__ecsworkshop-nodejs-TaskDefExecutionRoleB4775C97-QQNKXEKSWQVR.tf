# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role.r-ecsworkshop-nodejs-TaskDefExecutionRoleB4775C97-QQNKXEKSWQVR:
resource "aws_iam_role" "r-ecsworkshop-nodejs-TaskDefExecutionRoleB4775C97-QQNKXEKSWQVR" {
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
  name                 = "ecsworkshop-nodejs-TaskDefExecutionRoleB4775C97-QQNKXEKSWQVR"
  path                 = "/"
  tags                 = {}
  tags_all             = {}

  inline_policy {
    name = "TaskDefExecutionRoleDefaultPolicy0DBB737A"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "logs:CreateLogStream",
              "logs:PutLogEvents",
            ]
            Effect   = "Allow"
            Resource = format("arn:aws:logs:%s:%s:log-group:ecsworkshop-nodejs-ecsworkshopNodejsF670245F-RUPl52tiHWdZ:*", data.aws_region.current.name, data.aws_caller_identity.current.account_id)
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
}
