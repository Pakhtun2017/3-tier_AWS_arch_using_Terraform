resource "aws_security_group" "alb-security-group-app" {
  name        = var.alb-sg-app-name
  description = "App tier ALB Security Group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "HTTP from Web tier's ASG Security Group"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.asg-security-group-web.ids]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.alb-sg-app-name
  }
}
