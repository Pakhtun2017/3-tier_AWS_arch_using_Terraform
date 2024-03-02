resource "aws_security_group" "asg-security-group-app" {
  name        = var.asg-sg-app-name
  description = "App tier ASG Security Group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "HTTP from App tier ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-security-group-app.id]
  }

  ingress {
    description     = "SSH from ASG of the Web Tier"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.asg-security-group-web.id]
  }

  ingress {
    description = "ICMP from Anywhere"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.asg-sg-app-name
  }

}
