################################################################################
# VPC Module
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  name = var.name
  cidr = var.vpc_cidr

  azs                = ["${var.region}a", "${var.region}b"]
  private_subnets    = var.private_subnets_cidr
  public_subnets     = var.public_subnets_cidr
  enable_nat_gateway = var.enbable_nat_gateway
}
