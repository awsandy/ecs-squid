data "aws_ssm_parameter" "squid-endpoint" {
  name        = "/ecsworkshop/squid-endpoint"
}