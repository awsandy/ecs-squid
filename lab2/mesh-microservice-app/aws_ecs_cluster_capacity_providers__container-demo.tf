# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_ecs_cluster_capacity_providers.container-demo:
resource "aws_ecs_cluster_capacity_providers" "container-demo" {
  capacity_providers = [FARGATE]
  cluster_name       = "container-demo"
}
