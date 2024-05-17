locals {
  task_definition = var.service_task_definition
}

resource "aws_ecs_task_definition" "smile-app" {
  network_mode          = local.task_definition.networkMode
  cpu                   = local.task_definition.cpu
  memory                = local.task_definition.memory
  execution_role_arn    = aws_iam_role.fargate-role.arn
  task_role_arn         = aws_iam_role.fargate-role.arn
  family                = local.task_definition.family
  container_definitions = jsonencode(local.task_definition.containerDefinitions)
  runtime_platform {
    operating_system_family = local.task_definition.runtimePlatform.operatingSystemFamily
    cpu_architecture        = local.task_definition.runtimePlatform.cpuArchitecture
  }
  requires_compatibilities = ["FARGATE"]
}
