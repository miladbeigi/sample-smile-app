resource "aws_ecs_task_definition" "smile-app" {
  network_mode          = var.service_task_definition.networkMode
  cpu                   = var.service_task_definition.cpu
  memory                = var.service_task_definition.memory
  execution_role_arn    = aws_iam_role.fargate-role.arn
  task_role_arn         = aws_iam_role.fargate-role.arn
  family                = var.service_task_definition.family
  container_definitions = jsonencode(var.service_task_definition.containerDefinitions)
  runtime_platform {
    operating_system_family = var.service_task_definition.runtimePlatform.operatingSystemFamily
    cpu_architecture        = var.service_task_definition.runtimePlatform.cpuArchitecture
  }
  requires_compatibilities = ["FARGATE"]
}
