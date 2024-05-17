locals {
  sample-smile-app = jsondecode(templatefile("${path.module}/tasks/sample-smile-app.json", {
    image = var.image
  }))
}

resource "aws_ecs_task_definition" "smile-app" {
  network_mode          = local.sample-smile-app.networkMode
  cpu                   = local.sample-smile-app.cpu
  memory                = local.sample-smile-app.memory
  execution_role_arn    = aws_iam_role.fargate-role.arn
  task_role_arn         = aws_iam_role.fargate-role.arn
  family                = local.sample-smile-app.family
  container_definitions = jsonencode(local.sample-smile-app.containerDefinitions)
  runtime_platform {
    operating_system_family = local.sample-smile-app.runtimePlatform.operatingSystemFamily
    cpu_architecture        = local.sample-smile-app.runtimePlatform.cpuArchitecture
  }
  requires_compatibilities = ["FARGATE"]
}
