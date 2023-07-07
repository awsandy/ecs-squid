# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_ecs_task_definition.squid--custom-ecr-ECSTaskDefinition:
resource "aws_ecs_task_definition" "my-ECSTaskDefinition" {
  depends_on = [null_resource.load_ecr]
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
        environment           = [
                {
                    "name": "PORT",
                    "value": "8080"
                }
            ],
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
        image = format("%s.dkr.ecr.%s.amazonaws.com/%s:latest", data.aws_caller_identity.current.account_id, data.aws_region.current.name,var.app_name)
        links = []
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = data.aws_ssm_parameter.squid-loggroup.value
            awslogs-region        = data.aws_region.current.name
            awslogs-stream-prefix = var.app_name
          }
          secretOptions = []
        }
        memory      = 256
        mountPoints = []
        name        = var.app_name
        portMappings = [
          {
            containerPort = var.container_port
            hostPort      = var.host_port
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
  execution_role_arn = data.aws_iam_role.execution-role.arn
  family             = var.app_name
  memory             = "512"
  network_mode       = "awsvpc"
  requires_compatibilities = [
    "FARGATE",
  ]
  tags          = {}
  tags_all      = {}
  task_role_arn = data.aws_iam_role.execution-role.arn
}
