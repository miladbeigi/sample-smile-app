variable "vpc-name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc-cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "region" {
  description = "The AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "private-subnets-cidr" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public-subnets-cidr" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "enbable-nat-gateway" {
  description = "Whether to enable NAT gateways"
  type        = bool
  default     = false
}

variable "cluster-name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "desired_count" {
  description = "The desired number of tasks"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "The maximum capacity of the ECS service"
  type        = number
  default     = 1
}

variable "image" {
  description = "The Docker image to use"
  type        = string
}
