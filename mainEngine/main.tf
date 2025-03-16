# #Here I assume that the bucket and db table for statefile already exist. Nice to have versioning enabled on that s3
# terraform {
#   backend "s3" {
#     bucket         = "sonalake_homework_bucket" # Replace with your S3 bucket name
#     key            = "terraform/state.tfstate"    # Path to state file in the bucket
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-lock"       
#     encrypt        = true                        
#   }
# }

provider "aws" {
  region = var.region
}

module "vpc" {
  source               = "./../modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.0.2/22"]
  private_subnets_cidr = ["10.0.0.1/22"]
}

module "security_groups" {
  source      = "./../modules/SecurityGroups"
  vpc_id      = module.vpc.vpc_id
  allowed_ips = var.allowed_ips
}

module "iam" {
  source = "./../modules/iam"
}

# ECS module
module "ecs" {
  source             = "./../modules/ecs"
  cluster_name       = var.ecs_cluster_name
  task_family        = var.ecs-task-family
  container_image    = var.docker-image
  execution_role_arn = module.iam.ecs_task_execution_role_arn
  task_role_arn      = module.iam.ecs_task_role_arn
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.security_groups.ecs_security_group_id]
  service_name       = var.ecs-service-name
  ecs_cluster_id     = var.ecs_cluster_id
}

module "rds" {
  source             = "./../modules/RDSPostgres"
  db_name            = "sonalake-test-db"
  db_username        = var.db_user
  db_password        = var.db_password # Replace with secure password
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.security_groups.rds_security_group_id]
}
