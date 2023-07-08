resource "aws_ssm_parameter" "meshlb-dns" {
  name        = "/ecsworkshop/meshlb-dns"
  description = "The mesh lb dns"
  type        = "String"
  value       = aws_lb.arn_aws_elasticloadbalancing_eu-west-1_566972129213_loadbalancer_net_ecswo-MeshG-FLLW6SVH5ZXC_931d0198707acc37.dns_name
  tags = {
    workshop = "ecs-workshop"
  }
}

resource "aws_ssm_parameter" "meshlb-arn" {
  name        = "/ecsworkshop/meshlb-arn"
  description = "The mesh lb arn"
  type        = "String"
  value       = aws_lb.arn_aws_elasticloadbalancing_eu-west-1_566972129213_loadbalancer_net_ecswo-MeshG-FLLW6SVH5ZXC_931d0198707acc37.arn
  tags = {
    workshop = "ecs-workshop"
  }
}

resource "aws_ssm_parameter" "meshlb-vpc" {
  name        = "/ecsworkshop/meshlb-vpc"
  description = "The mesh lb vpc"
  type        = "String"
  value       = aws_vpc.vpc-057a64aaa8d96235b.id
  tags = {
    workshop = "ecs-workshop"
  }
}

