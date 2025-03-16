# modules/rds/main.tf

resource "aws_db_instance" "postgres" {
  identifier             = var.db_name
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}
