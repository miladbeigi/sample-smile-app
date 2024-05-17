resource "aws_lb" "smile" {
  name               = "smile-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.smile-lb-sg.id]
  subnets            = var.public_subnets
  idle_timeout       = 300
}

resource "aws_lb_target_group" "smile" {
  name        = "smile-alb-tg"
  target_type = "ip"
  port        = 3001
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "3001"
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 3
    interval            = 30
    enabled             = true
    matcher             = "200-399"
  }
}

resource "aws_lb_listener" "smile" {
  load_balancer_arn = aws_lb.smile.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.smile.arn
  }
}
