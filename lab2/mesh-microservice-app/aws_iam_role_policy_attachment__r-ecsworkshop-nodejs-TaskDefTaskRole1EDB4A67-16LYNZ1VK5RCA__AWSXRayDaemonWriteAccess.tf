# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# ../../scripts/052-get-iam-attached-role-policies.sh
# aws_iam_role_policy_attachment.r-ecsworkshop-nodejs-TaskDefTaskRole1EDB4A67-16LYNZ1VK5RCA__AWSXRayDaemonWriteAccess:
resource "aws_iam_role_policy_attachment" "r-ecsworkshop-nodejs-TaskDefTaskRole1EDB4A67-16LYNZ1VK5RCA__AWSXRayDaemonWriteAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
  role       = aws_iam_role.r-ecsworkshop-nodejs-TaskDefTaskRole1EDB4A67-16LYNZ1VK5RCA.id
}