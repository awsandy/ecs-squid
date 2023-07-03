output "aws_ecr_repository__squid-ecr-ecrrepository__id" {
  value = aws_ecr_repository.squid-ecr-ecrrepository.name
}

output "endpoint_service_name" {
  value = aws_vpc_endpoint_service.vpce-svc-09041d05a3a2059cc.service_name
}

output "endpoint_service_dns" {
  value = aws_vpc_endpoint_service.vpce-svc-09041d05a3a2059cc.base_endpoint_dns_names
}
