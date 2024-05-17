vpc-name             = "smile-network"
vpc-cidr             = "10.0.0.0/16"
private-subnets-cidr = ["10.0.1.0/24", "10.0.2.0/24"]
public-subnets-cidr  = ["10.0.101.0/24", "10.0.102.0/24"]
region               = "eu-west-1"
cluster-name         = "smile-cluster"
desired_count        = 1
max_capacity         = 1
image                = "miladbeigi/sample-smile-app:0.0.4"
