# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role.r-ecsworkshop-crystal-TaskDefTaskRole1EDB4A67-B60AY8893QDS:
resource "aws_iam_role" "r-ecsworkshop-crystal-TaskDefTaskRole1EDB4A67-B60AY8893QDS" {
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
    "arn:aws:iam::aws:policy/AWSAppMeshEnvoyAccess",
    "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
  ]
  max_session_duration = 3600
  name                 = "ecsworkshop-crystal-TaskDefTaskRole1EDB4A67-B60AY8893QDS"
  path                 = "/"
  tags                 = {}
  tags_all             = {}

  inline_policy {
    name = "TaskDefTaskRoleDefaultPolicyA592CB18"
    policy = jsonencode(
      {
        Statement = [
          {
            Action   = "ec2:DescribeSubnets"
            Effect   = "Allow"
            Resource = "*"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
}