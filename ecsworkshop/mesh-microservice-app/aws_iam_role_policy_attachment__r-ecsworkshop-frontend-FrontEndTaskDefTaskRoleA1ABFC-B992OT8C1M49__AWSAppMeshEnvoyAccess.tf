# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# ../../scripts/052-get-iam-attached-role-policies.sh
# aws_iam_role_policy_attachment.r-ecsworkshop-frontend-FrontEndTaskDefTaskRoleA1ABFC-B992OT8C1M49__AWSAppMeshEnvoyAccess:
resource "aws_iam_role_policy_attachment" "r-ecsworkshop-frontend-FrontEndTaskDefTaskRoleA1ABFC-B992OT8C1M49__AWSAppMeshEnvoyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AWSAppMeshEnvoyAccess"
  role       = aws_iam_role.r-ecsworkshop-frontend-FrontEndTaskDefTaskRoleA1ABFC-B992OT8C1M49.id
}
