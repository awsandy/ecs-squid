resource "aws_ssm_parameter" "squid-endpoint" {
  name        = "/ecsworkshop/squid-endpoint"
  description = "The private endpoint dns"
  type        = "String"
  value       = tolist(aws_vpc_endpoint_service.vpce-svc-09041d05a3a2059cc.base_endpoint_dns_names)[0]

  tags = {
    workshop = "ecs-workshop"
  }
}