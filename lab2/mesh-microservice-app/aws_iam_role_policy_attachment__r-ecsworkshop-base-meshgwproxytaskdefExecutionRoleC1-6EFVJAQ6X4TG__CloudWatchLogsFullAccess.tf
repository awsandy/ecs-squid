# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# ../../scripts/052-get-iam-attached-role-policies.sh
# aws_iam_role_policy_attachment.r-ecsworkshop-base-meshgwproxytaskdefExecutionRoleC1-6EFVJAQ6X4TG__CloudWatchLogsFullAccess:
resource "aws_iam_role_policy_attachment" "r-ecsworkshop-base-meshgwproxytaskdefExecutionRoleC1-6EFVJAQ6X4TG__CloudWatchLogsFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role       = aws_iam_role.r-ecsworkshop-base-meshgwproxytaskdefExecutionRoleC1-6EFVJAQ6X4TG.id
}
