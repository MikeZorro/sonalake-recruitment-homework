# Security group for ECS
resource "aws_security_group" "ecs_security_group" {
  name   = "ecs-security-group"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow HTTPS traffic from the specific IP range"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Security group for RDS
resource "aws_security_group" "rds_security_group" {
  name   = "rds_security_group"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
