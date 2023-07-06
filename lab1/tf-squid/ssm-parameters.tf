resource "aws_ssm_parameter" "squid-dns" {
  name        = "/ecsworkshop/squid-dns"
  description = "The private endpoint dns"
  type        = "String"
  value       = tolist(aws_vpc_endpoint_service.vpce-svc-09041d05a3a2059cc.base_endpoint_dns_names)[0]

  tags = {
    workshop = "ecs-workshop"
  }
}

resource "aws_ssm_parameter" "squid-endpointservice" {
  name        = "/ecsworkshop/squid-endpointservice"
  description = "The private endpoint service"
  type        = "String"
  value       = aws_vpc_endpoint_service.vpce-svc-09041d05a3a2059cc.service_name

  tags = {
    workshop = "ecs-workshop"
  }
}