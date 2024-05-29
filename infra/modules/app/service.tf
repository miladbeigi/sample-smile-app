resource "aws_ecs_service" "this" {
  name            = "sample-smile-app"
  cluster         = var.cluster_arn
  task_definition = aws_ecs_task_definition.smile-app.arn

  desired_count                      = var.desired_count
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = [aws_security_group.app.id]
    subnets          = var.private_subnets
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.smile.arn
    container_name   = "sample-smile-app"
    container_port   = 3001
  }
}
