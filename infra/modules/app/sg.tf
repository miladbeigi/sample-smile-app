
resource "aws_security_group" "app" {
  name   = "smile-app-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "smile-lb-sg" {
  name   = "smile-loadbalancer-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "http-ingress" {
  type              = "ingress"
  from_port         = 3001
  to_port           = 3001
  protocol          = "tcp"
  security_group_id = aws_security_group.app.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.app.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "smile-lb-ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.smile-lb-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "smile-lb-egress" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.smile-lb-sg.id
  source_security_group_id = aws_security_group.app.id
}
