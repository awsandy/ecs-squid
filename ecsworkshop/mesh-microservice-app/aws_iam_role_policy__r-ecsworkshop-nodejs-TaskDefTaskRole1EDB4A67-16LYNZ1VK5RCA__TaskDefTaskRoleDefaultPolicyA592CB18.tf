# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role_policy.r-ecsworkshop-nodejs-TaskDefTaskRole1EDB4A67-16LYNZ1VK5RCA__TaskDefTaskRoleDefaultPolicyA592CB18:
resource "aws_iam_role_policy" "r-ecsworkshop-nodejs-TaskDefTaskRole1EDB4A67-16LYNZ1VK5RCA__TaskDefTaskRoleDefaultPolicyA592CB18" {
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
  role = aws_iam_role.r-ecsworkshop-nodejs-TaskDefTaskRole1EDB4A67-16LYNZ1VK5RCA.id
}
