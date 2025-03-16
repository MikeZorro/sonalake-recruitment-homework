variable "rds_resource_arn" {
  description = "ARN of the RDS resource the ECS task will access"
  type        = string
  default     = "*"
}