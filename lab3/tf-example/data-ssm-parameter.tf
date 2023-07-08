data "aws_ssm_parameter" "meshlb-arn" {
  name        = "/ecsworkshop/meshlb-arn"
}

data "aws_ssm_parameter" "meshlb-vpc" {
  name        = "/ecsworkshop/meshlb-vpc"
}

data "aws_ssm_parameter" "mesh-subnet1" {
  name        = "/ecsworkshop/mesh-subnet1"
}

data "aws_ssm_parameter" "mesh-subnet2" {
  name        = "/ecsworkshop/mesh-subnet2"
}

data "aws_ssm_parameter" "mesh-subnet3" {
  name        = "/ecsworkshop/mesh-subnet3"
}

data "aws_ssm_parameter" "mesh-sg" {
  name        = "/ecsworkshop/mesh-sg"
}

data  "aws_ssm_parameter" "mesh-cluster" {
  name        = "/ecsworkshop/mesh-cluster"
}