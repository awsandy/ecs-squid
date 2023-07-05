# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_ecs_task_definition.ecsworkshopcrystalTaskDefAEA199B7_6:
resource "aws_ecs_task_definition" "ecsworkshopcrystalTaskDefAEA199B7_6" {
  container_definitions = jsonencode(
    [
      {
        command = []
        cpu     = 0
        dependsOn = [
          {
            condition     = "START"
            containerName = "xray"
          },
        ]
        dnsSearchDomains      = []
        dnsServers            = []
        dockerLabels          = {}
        dockerSecurityOptions = []
        entryPoint            = []
        environment = [
          {
            name  = "APPMESH_RESOURCE_ARN"
            value = format("arn:aws:appmesh:%s:%s:mesh/ecs-mesh/virtualNode/crystal", data.aws_region.current.name, data.aws_caller_identity.current.account_id)
          },
          {
            name  = "ENABLE_ENVOY_STATS_TAGS"
            value = "1"
          },
          {
            name  = "ENABLE_ENVOY_XRAY_TRACING"
            value = "1"
          },
          {
            name  = "ENVOY_LOG_LEVEL"
            value = "debug"
          },
          {
            name  = "REGION"
            value = data.aws_region.current.name
          },
        ]
        environmentFiles = []
        essential        = true
        extraHosts       = []
        healthCheck = {
          command = [
            "CMD-SHELL",
            "curl -s http://localhost:9901/server_info | grep state | grep -q LIVE",
          ]
          interval = 5
          retries  = 10
          timeout  = 10
        }
        image = "public.ecr.aws/appmesh/aws-appmesh-envoy:v1.18.3.0-prod"
        links = []
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = aws_cloudwatch_log_group.ecsworkshop-crystal-ecsworkshopCrystal62CE0187-vLA7bFtsJaCA.name
            awslogs-region        = data.aws_region.current.name
            awslogs-stream-prefix = "/mesh-envoy-container"
          }
          secretOptions = []
        }
        memoryReservation = 128
        mountPoints       = []
        name              = "envoy"
        portMappings      = []
        secrets           = []
        systemControls    = []
        ulimits = [
          {
            hardLimit = 15000
            name      = "nofile"
            softLimit = 15000
          },
        ]
        user        = "1337"
        volumesFrom = []
      },
      {
        command = []
        cpu     = 0
        dependsOn = [
          {
            condition     = "HEALTHY"
            containerName = "envoy"
          },
        ]
        dnsSearchDomains      = []
        dnsServers            = []
        dockerLabels          = {}
        dockerSecurityOptions = []
        entryPoint            = []
        environment = [
          {
            name  = "REGION"
            value = data.aws_region.current.name
          },
        ]
        environmentFiles = []
        essential        = true
        extraHosts       = []
        image            = "public.ecr.aws/aws-containers/ecsdemo-crystal"
        links            = []
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = aws_cloudwatch_log_group.ecsworkshop-crystal-ecsworkshopCrystal62CE0187-vLA7bFtsJaCA.name
            awslogs-region        = data.aws_region.current.name
            awslogs-stream-prefix = "/crystal-container"
          }
          secretOptions = []
        }
        memoryReservation = 128
        mountPoints       = []
        name              = "crystal-app"
        portMappings = [
          {
            containerPort = 3000
            hostPort      = 3000
            protocol      = "tcp"
          },
        ]
        secrets        = []
        systemControls = []
        ulimits        = []
        volumesFrom    = []
      },
      {
        command               = []
        cpu                   = 0
        dnsSearchDomains      = []
        dnsServers            = []
        dockerLabels          = {}
        dockerSecurityOptions = []
        entryPoint            = []
        environment           = []
        environmentFiles      = []
        essential             = true
        extraHosts            = []
        image                 = "amazon/aws-xray-daemon"
        links                 = []
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = aws_cloudwatch_log_group.ecsworkshop-crystal-ecsworkshopCrystal62CE0187-vLA7bFtsJaCA.name
            awslogs-region        = data.aws_region.current.name
            awslogs-stream-prefix = "/xray-container"
          }
          secretOptions = []
        }
        memoryReservation = 256
        mountPoints       = []
        name              = "xray"
        portMappings      = []
        secrets           = []
        systemControls    = []
        ulimits           = []
        user              = "1337"
        volumesFrom       = []
      },
    ]
  )
  cpu                = "256"
  execution_role_arn = aws_iam_role.r-ecsworkshop-crystal-TaskDefExecutionRoleB4775C97-18OFKAH8B753G.arn
  family             = "ecsworkshopcrystalTaskDefAEA199B7"
  memory             = "512"
  network_mode       = "awsvpc"
  requires_compatibilities = [
    "EC2",
    "FARGATE",
  ]
  tags          = {}
  tags_all      = {}
  task_role_arn = aws_iam_role.r-ecsworkshop-crystal-TaskDefTaskRole1EDB4A67-B60AY8893QDS.arn

  proxy_configuration {
    container_name = "envoy"
    properties = {
      "AppPorts"         = "3000"
      "EgressIgnoredIPs" = "169.254.170.2,169.254.169.254"
      "IgnoredUID"       = "1337"
      "ProxyEgressPort"  = "15001"
      "ProxyIngressPort" = "15000"
    }
    type = "APPMESH"
  }
}
