variable "vpc_id" {
  description = "The VPC ID for the security groups"
  type        = string
}

variable "allowed_ips" {
  description = "List of allowed IP ranges for ECS ingress traffic"
  type        = list(string)
}