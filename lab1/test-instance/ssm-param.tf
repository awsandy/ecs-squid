data "aws_ssm_parameter" "squid-dns" {
  name        = "/ecsworkshop/squid-dns"
}

data "aws_ssm_parameter" "squid-endpointservice" {
  name        = "/ecsworkshop/squid-endpointservice"
}