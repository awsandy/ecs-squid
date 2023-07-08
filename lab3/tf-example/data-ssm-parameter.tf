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

data "aws_ssm_parameter" "squid-execution-role" {
  name        = "/ecsworkshop/squid-execution-role"
}

data "aws_ssm_parameter" "squid-loggroup" {
  name        = "/ecsworkshop/squid-loggroup"
}

data "aws_ssm_parameter" "squid-subnet1" {
  name        = "/ecsworkshop/squid-subnet1"
}

data "aws_ssm_parameter" "squid-subnet2" {
  name        = "/ecsworkshop/squid-subnet2"
}

data "aws_ssm_parameter" "squid-sg" {
  name        = "/ecsworkshop/squid-sg"
}

data "aws_ssm_parameter" "squid-tg" {
  name        = "/ecsworkshop/squid-tg"
}

data "aws_ssm_parameter" "squid-vpc" {
  name        = "/ecsworkshop/squid-vpc"
}

data "aws_ssm_parameter" "squid-lbarn" {
  name        = "/ecsworkshop/squid-lbarn"
}