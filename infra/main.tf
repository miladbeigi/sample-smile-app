locals {
  sample-smile-app = jsondecode(templatefile("./tasks/sample-smile-app.json", {
    image  = var.image
    region = var.region
  }))
}

module "network" {
  source               = "./modules/core-network"
  name                 = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  region               = var.region
  private_subnets_cidr = var.private_subnets_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  enbable_nat_gateway  = var.enbable_nat_gateway
}

module "ecs" {
  source       = "./modules/ecs"
  cluster_name = var.cluster_name
}

module "app" {
  source                  = "./modules/app"
  cluster_arn             = module.ecs.cluster_arn
  cluster_name            = module.ecs.cluster_name
  vpc_id                  = module.network.vpc_id
  public_subnets          = module.network.public_subnets
  desired_count           = var.desired_count
  max_capacity            = var.max_capacity
  image                   = var.image
  service_task_definition = local.sample-smile-app
}
