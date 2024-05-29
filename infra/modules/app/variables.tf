variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}
variable "cluster_arn" {
  description = "The ARN of the ECS cluster"
  type        = string
}

variable "private_subnets" {
  description = "The private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "The public subnets"
  type        = list(string)
}

variable "image" {
  description = "The Docker image to use"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "desired_count" {
  description = "The desired number of tasks"
  type        = number
}

variable "max_capacity" {
  description = "The maximum number of tasks"
  type        = number
}

variable "service_task_definition" {}
