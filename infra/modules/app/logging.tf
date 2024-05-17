resource "aws_cloudwatch_log_group" "smile" {
  name              = "/ecs/smile/sample-smile-app"
  retention_in_days = 14
}
