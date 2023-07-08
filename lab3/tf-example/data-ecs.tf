data "aws_ecs_cluster" "cluster" {
  cluster_name = data.aws_ssm_parameter.mesh-cluster.value
}

data "aws_iam_role" "execution-role" {
  name = data.aws_ssm_parameter.squid-execution-role.value
}


