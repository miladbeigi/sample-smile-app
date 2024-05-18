# Project Documentation

## Part 1 && 2: REST API and Docker
The server is a simple REST API that is built using express.js. To run the application locally, you can use two approaches:

### 1. Docker
To run the application using Docker, you can use the following commands:

```bash
cd app && docker compose up -d --build
```
or
```bash
cd app && make run
```
To only build the application, you can use the following command:

```bash
cd app && make build
```
### 2. Local
To run the application locally without Docker, you can use the following commands:

```bash
cd app && npm install && npm start
```

## Part 3: Deployment on Production Environment

### Part 3.1: Kubernetes
The application is deployed to a Kubernetes cluster using the following commands:

```bash
cd k8s && kubectl apply -f .
```
### Part 3.2: Terraform
The application is deployed to AWS ECS (Fargate) using Terraform. To deploy the application, you can use the following commands:

```bash
cd infra && terraform init && terraform apply
```

### Modules

#### core-network

This module creates the VPC, subnets, internet gateway, NAT gateway, and route tables needed for the application. I am using the `terraform-aws-modules/vpc/aws` module to create the VPC. This is a standard module and creates all needed resources for a VPC. If needed there are many variables that can be used to customize the VPC. But I only used the NAT gateway and subnet variables.

#### ecs
This module creates an ECS Cluster. 

#### app

This module creates necessary resources to run the application on ECS Fargate. It also create some autoscaling policies to monitor the application. The module uses load balancer to expose the application to the internet. The security groups only allow the traffic from the load balancer to the application.

## GitHub Workflows

### test.yml

This workflow runs some minimal tests for the application and infrastructure. For application, It only builds the docker image to make sure the docker image can be built successfully. For infrastructure, runs `terraform validate` and `terraform fmt` to make sure the terraform code is valid and formatted correctly.

### security.yml

This workflow checks the docker image for vulnerabilities using Snyk.