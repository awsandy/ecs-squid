# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_ecs_service.squid-ecr-ECSCluster__squid-ecr-ECSService-Kf9lgxSDQTcT:
resource "aws_ecs_service" "squid-ecr-ECSCluster__squid-ecr-ECSService-Kf9lgxSDQTcT" {
  cluster                            = aws_ecs_cluster.squid-ecr-ECSCluster.arn
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 3
  enable_ecs_managed_tags            = false
  enable_execute_command             = false
  health_check_grace_period_seconds  = 0
  #iam_role                           = "/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  launch_type                        = "FARGATE"
  name                               = "squid-ecr-ECSService-Kf9lgxSDQTcT"
  platform_version                   = "LATEST"
  scheduling_strategy                = "REPLICA"
  tags                               = {}
  tags_all                           = {}
  task_definition                    = aws_ecs_task_definition.squid--standard-ecr-ECSTaskDefinition.arn
  triggers                           = {}

  deployment_circuit_breaker {
    enable   = false
    rollback = false
  }

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    container_name   = "squid-ecr-SquidProxyContainer"
    container_port   = 3128
    target_group_arn = aws_lb_target_group.arn_aws_elasticloadbalancing_targetgroup_squid-ecr.arn
  }

  network_configuration {
    assign_public_ip = false
    security_groups = [
      aws_security_group.sg-0b7aada9480a491f5.id,
    ]
    subnets = [
      aws_subnet.subnet-0445458c15388c163.id,
      aws_subnet.subnet-08aae867856e9c1ac.id,
    ]
  }
}