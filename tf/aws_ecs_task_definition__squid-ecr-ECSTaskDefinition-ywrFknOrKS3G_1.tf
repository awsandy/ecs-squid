# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_ecs_task_definition.squid-ecr-ECSTaskDefinition_1:
resource "aws_ecs_task_definition" "squid-ecr-ECSTaskDefinition_1" {
  container_definitions = jsonencode(
    [
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
        healthCheck = {
          command = [
            "CMD-SHELL",
            "exit 0",
          ]
          interval = 5
          retries  = 2
          timeout  = 3
        }
        image = "public.ecr.aws/ubuntu/squid:latest"
        links = []
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = aws_cloudwatch_log_group.squid-ecr-ECSTaskLogGroup-s2EMEBzWf9GA.name
            awslogs-region        = "eu-west-2"
            awslogs-stream-prefix = "sqProxy"
          }
          secretOptions = []
        }
        memory      = 256
        mountPoints = []
        name        = "squid-ecr-SquidProxyContainer"
        portMappings = [
          {
            containerPort = 3128
            hostPort      = 3128
            protocol      = "tcp"
          },
        ]
        secrets        = []
        systemControls = []
        ulimits        = []
        volumesFrom    = []
      },
    ]
  )
  cpu                = "256"
  execution_role_arn = aws_iam_role.r-squid-ecr-ECSTaskExecutionRole-BSNU23J2XF0S.arn
  family             = "squid-ecr-ECSTaskDefinition"
  memory             = "512"
  network_mode       = "awsvpc"
  requires_compatibilities = [
    "FARGATE",
  ]
  tags          = {}
  tags_all      = {}
  task_role_arn = aws_iam_role.r-squid-ecr-ECSTaskExecutionRole-BSNU23J2XF0S.arn
}
