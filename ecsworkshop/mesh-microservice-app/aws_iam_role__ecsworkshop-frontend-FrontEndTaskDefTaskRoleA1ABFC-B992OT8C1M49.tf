# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role.r-ecsworkshop-frontend-FrontEndTaskDefTaskRoleA1ABFC-B992OT8C1M49:
resource "aws_iam_role" "r-ecsworkshop-frontend-FrontEndTaskDefTaskRoleA1ABFC-B992OT8C1M49" {
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
  name                 = "ecsworkshop-frontend-FrontEndTaskDefTaskRoleA1ABFC-B992OT8C1M49"
  path                 = "/"
  tags                 = {}
  tags_all             = {}

  inline_policy {
    name = "FrontEndTaskDefTaskRoleDefaultPolicyF5EFB956"
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
