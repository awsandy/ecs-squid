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

resource "aws_ssm_parameter" "mesh-subnet1" {
  name        = "/ecsworkshop/mesh-subnet1"
  description = "The squid cluster 1st subnet"
  type        = "String"

  value       = aws_subnet.subnet-00a09562a158644f8.id

  tags = {
    workshop = "ecs-workshop"
  }
}

resource "aws_ssm_parameter" "mesh-subnet2" {
  name        = "/ecsworkshop/mesh-subnet2"
  description = "The squid cluster 2nd subnet"
  type        = "String"

  value       = aws_subnet.subnet-090ea4dad86354a04.id

  tags = {
    workshop = "ecs-workshop"
  }
}

resource "aws_ssm_parameter" "mesh-subnet3" {
  name        = "/ecsworkshop/mesh-subnet3"
  description = "The squid cluster 3rd subnet"
  type        = "String"

  value       = aws_subnet.subnet-0a449930323b84bbf.id

  tags = {
    workshop = "ecs-workshop"
  }
}



resource "aws_ssm_parameter" "mesh-sg" {
  name        = "/ecsworkshop/squid-sg"
  description = "The squid cluster security group"
  type        = "String"

  value       = aws_security_group.sg-0838ad2e105c5c736.id

  tags = {
    workshop = "ecs-workshop"
  }
}


resource  "aws_ssm_parameter" "mesh-cluster" {
  name        = "/ecsworkshop/mesh-cluster"
  description = "The squid cluster security group"
  type        = "String"

  value       = aws_ecs_cluster_capacity_providers.container-demo.name

  tags = {
    workshop = "ecs-workshop"
  }

}


