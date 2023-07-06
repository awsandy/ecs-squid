resource "aws_vpc_endpoint" "squid_service" {
  vpc_id            = aws_vpc.ec2-vpc.id
  service_name      = data.aws_vpc_endpoint_service.squid.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.ingress-at.id,
  ]

  subnet_ids          = [aws_subnet.subnet-priv1.id]
  private_dns_enabled = false
}


data "aws_vpc_endpoint_service" "squid" {
  service_name = data.aws_ssm_parameter.squid-endpointservice.value
}
