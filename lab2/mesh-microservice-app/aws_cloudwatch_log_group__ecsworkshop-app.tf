# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_cloudwatch_log_group.ecsworkshop-frontend:
resource "aws_cloudwatch_log_group" "ecsworkshop-app" {
  name              = "ecsworkshop-app"
  retention_in_days = 7
  tags              = {}
  tags_all          = {}
}