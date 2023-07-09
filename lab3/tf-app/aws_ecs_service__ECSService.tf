# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_ecs_service.squid-ecr-ECSCluster__squid-ecr-ECSService-Kf9lgxSDQTcT:
resource "aws_ecs_service" "squid-ecr-ECSCluster__squid-ecr-ECSService-Kf9lgxSDQTcT" {
  cluster                            = data.aws_ecs_cluster.cluster.cluster_name
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 3
  enable_ecs_managed_tags            = false
  enable_execute_command             = false
  health_check_grace_period_seconds  = 0
  #iam_role                           = "/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  launch_type                        = "FARGATE"
  name                               = format("%s-service",var.app_name)
  platform_version                   = "LATEST"
  scheduling_strategy                = "REPLICA"
  tags                               = {}
  tags_all                           = {}
  task_definition                    = aws_ecs_task_definition.my-ECSTaskDefinition.arn
  triggers                           = {}

  deployment_circuit_breaker {
    enable   = false
    rollback = false
  }

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    container_name   = var.app_name
    container_port   = var.container_port
    target_group_arn = aws_lb_target_group.app.arn
  }

  network_configuration {
    assign_public_ip = false
    security_groups = [
      data.aws_ssm_parameter.squid-sg.value,
    ]
    subnets = [
      data.aws_ssm_parameter.squid-subnet1.value,
      data.aws_ssm_parameter.squid-subnet2.value,
    ]
  }
}