variable "region" {
  description = "The region to use"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "s3 name for statefile storage"
  type        = string
  default     = "sonalake_homework_bucket"
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type = string
}

variable "allowed_ips" {
  type    = list(string)
  default = ["75.2.60.0/24"]
}

variable "ecs_cluster_name" {
  type    = string
  default = "sonalake-test-cluster"
}

variable "ecs-task-family" {
  type    = string
  default = "sonalake-task"
}

variable "docker-image" {
  type    = string
  default = "test-image/1.0.0"
}

variable "ecs-service-name" {
  type    = string
  default = "sonalake-ecs-service"
}

variable "ecs_cluster_id" {
  description = "Existing Fargate cluster Id"
  type        = string
}