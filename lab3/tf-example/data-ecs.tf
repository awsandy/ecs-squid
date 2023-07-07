data "aws_ecs_cluster" "cluster" {
  cluster_name = var.cluster_name
}

data "aws_iam_role" "execution-role" {
  name = var.execution_role_name
}