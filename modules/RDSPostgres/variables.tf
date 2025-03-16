variable "db_name" {
  description = "The name of the RDS database"
  type        = string
}

variable "instance_class" {
  description = "Instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "parameter_group_name" {
  description = "The name of the parameter group"
  type        = string
  default     = "default.postgres13"
}

variable "db_username" {
  description = "The master username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The master password for the RDS database"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS database"
  type        = number
  default     = 5
}

variable "security_group_ids" {
  description = "Security groups for the RDS instance"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Subnets for the RDS instance"
  type        = list(string)
}
