# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# ../../scripts/052-get-iam-attached-role-policies.sh
# aws_iam_role_policy_attachment.r-ecsworkshop-crystal-TaskDefExecutionRoleB4775C97-18OFKAH8B753G__AmazonEC2ContainerRegistryReadOnly:
resource "aws_iam_role_policy_attachment" "r-ecsworkshop-crystal-TaskDefExecutionRoleB4775C97-18OFKAH8B753G__AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.r-ecsworkshop-crystal-TaskDefExecutionRoleB4775C97-18OFKAH8B753G.id
}