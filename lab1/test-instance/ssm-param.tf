data "aws_ssm_parameter" "squid-dns" {
  name        = "/ecsworkshop/squid-dns"
}

data "aws_ssm_parameter" "squid-endpointservice" {
  name        = "/ecsworkshop/squid-endpointservice"
}



resource "aws_ssm_parameter" "proxy-dns" {
  name        = "/ecsworkshop/proxy-dns"
  description = "The private endpoint dns"
  type        = "String"
  value = aws_vpc_endpoint.squid_service.dns_entry[0].dns_name

  tags = {
    workshop = "ecs-workshop"
  }
}



