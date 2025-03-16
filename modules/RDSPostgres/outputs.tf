resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}
