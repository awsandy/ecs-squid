# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_ecs_service.container-demo__mesh-gw-proxy:
resource "aws_ecs_service" "container-demo__mesh-gw-proxy" {
  cluster                            = aws_ecs_cluster.container-demo.arn
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 50
  desired_count                      = 1
  enable_ecs_managed_tags            = false
  enable_execute_command             = false
  health_check_grace_period_seconds  = 60
  launch_type                        = "FARGATE"
  name                               = "mesh-gw-proxy"
  platform_version                   = "LATEST"
  scheduling_strategy                = "REPLICA"
  tags                               = {}
  tags_all                           = {}
  task_definition                    = aws_ecs_task_definition.mesh-gw-proxy-taskdef_4.arn
  triggers                           = {}

  deployment_circuit_breaker {
    enable   = false
    rollback = false
  }

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    container_name   = "envoy"
    container_port   = 3000
    target_group_arn = aws_lb_target_group.arn_aws_elasticloadbalancing_eu-west-2_566972129213_targetgroup_ecswor-MeshG-MJA2UCVRN7TB_b9c93bfa2c16729f.arn
  }

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.sg-0838ad2e105c5c736.id,
    ]
    subnets = [
      aws_subnet.subnet-00a09562a158644f8.id,
      aws_subnet.subnet-090ea4dad86354a04.id,
      aws_subnet.subnet-0a449930323b84bbf.id,
    ]
  }

  service_registries {
    container_port = 0
    port           = 0
    registry_arn   = aws_service_discovery_service.srv-y7eei2jrbpto3ryy.arn
  }
}
