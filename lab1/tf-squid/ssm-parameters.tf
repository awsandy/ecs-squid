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


resource "aws_ssm_parameter" "squid-execution-role" {
  name        = "/ecsworkshop/squid-execution-role"
  description = "The execution role"
  type        = "String"
  value       = aws_iam_role.r-squid-ecr-ECSTaskExecutionRole-BSNU23J2XF0S.arn

  tags = {
    workshop = "ecs-workshop"
  }
}


resource "aws_ssm_parameter" "squid-loggroup" {
  name        = "/ecsworkshop/squid-loggroup"
  description = "The squid cluster cloudwatch log group"
  type        = "String"

  value       = aws_cloudwatch_log_group.squid-ecr-ECSTaskLogGroup-s2EMEBzWf9GA.name

  tags = {
    workshop = "ecs-workshop"
  }
}


resource "aws_ssm_parameter" "squid-subnet1" {
  name        = "/ecsworkshop/squid-subnet1"
  description = "The squid cluster 1st subnet"
  type        = "String"

  value       = aws_subnet.subnet-0445458c15388c163.id

  tags = {
    workshop = "ecs-workshop"
  }
}

resource "aws_ssm_parameter" "squid-subnet2" {
  name        = "/ecsworkshop/squid-subnet2"
  description = "The squid cluster 2nd subnet"
  type        = "String"

  value       = aws_subnet.subnet-08aae867856e9c1ac.id

  tags = {
    workshop = "ecs-workshop"
  }
}

resource "aws_ssm_parameter" "squid-sg" {
  name        = "/ecsworkshop/squid-sg"
  description = "The squid cluster security group"
  type        = "String"

  value       = aws_security_group.sg-0b7aada9480a491f5.id

  tags = {
    workshop = "ecs-workshop"
  }
}


resource "aws_ssm_parameter" "squid-tg" {
  name        = "/ecsworkshop/squid-tg"
  description = "The squid cluster cloudwatch log group"
  type        = "String"

  value       = aws_lb_target_group.arn_aws_elasticloadbalancing_targetgroup_squid-ecr.arn

  tags = {
    workshop = "ecs-workshop"
  }
}