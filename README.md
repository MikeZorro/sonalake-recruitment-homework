Hello,

This is the solution for the following homework:

Prepare Terraform code which creates AWS infrastructure for the following components:

ECS task which is running docker image containing application.

Application is exposing REST API over 8080 port. 

We would like to get this endpoint accessible over https connection from outside AWS.

We would like this endpoint to be only accessible by clients of IPs 75.2.60.*

RDS DB of PostgreSQL which can be accessed from application running in docker



I assumed that following infrastructure already exists and can be used:
        - ECS Fargate cluster
        - S3 bucket and DynamoDb for statefile
Possible improvements:
- Introduce Application Load Balancer for following benefits:
        1. SSL Termination
        2. Moving ECS to private subnet
        3. Traffic flows to application throught Load Balancer and therefore we do not expose application via public IP
Than need to change ECS task definition to expose port 8080. I have made the assumption that the SSL termination can be handled by the app.
- Some tagging strategy to fit in a larger infrastructure
- Store secrets for db in cloud based Key Vault like AWS Secrets Manager or HashicorpVault
- More granular iam policy to limit execution role to only specific ecs/rds
