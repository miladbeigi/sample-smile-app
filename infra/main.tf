locals {
  sample-smile-app = jsondecode(templatefile("./tasks/sample-smile-app.json", {
    image = var.image
  }))
}
module "network" {
  source               = "./modules/core-network"
  name                 = var.vpc-name
  vpc-cidr             = var.vpc-cidr
  region               = var.region
  private-subnets-cidr = var.private-subnets-cidr
  public-subnets-cidr  = var.public-subnets-cidr
  enbable-nat-gateway  = var.enbable-nat-gateway
}

module "ecs" {
  source       = "./modules/ecs"
  cluster_name = var.cluster-name
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
