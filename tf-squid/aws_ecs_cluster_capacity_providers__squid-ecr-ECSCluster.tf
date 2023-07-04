# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_ecs_cluster_capacity_providers.squid-ecr-ECSCluster:
resource "aws_ecs_cluster_capacity_providers" "squid-ecr-ECSCluster" {
  capacity_providers = [
    "FARGATE",
    "FARGATE_SPOT",
  ]
  cluster_name = "squid-ecr-ECSCluster"
}