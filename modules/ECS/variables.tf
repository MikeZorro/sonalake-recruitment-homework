variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "task_family" {
  description = "Family name for the ECS task definition"
  type        = string
}

variable "container_image" {
  description = "Docker image for the container"
  type        = string
}

variable "cpu" {
  description = "CPU for ECS task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory for ECS task"
  type        = string
  default     = "512"
}

variable "subnet_ids" {
  description = "Subnets for the ECS service"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups for the ECS service"
  type        = list(string)
}

variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
  default     = 1
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN of the ECS Task Execution Role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the ECS Task Role"
  type        = string
}

variable "ecs_cluster_id" {
  description = "Existing Fargate cluster Id"
  type        = string
}