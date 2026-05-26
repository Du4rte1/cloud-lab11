#terraform trigger
#test workflow

provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = {
    Project     = "AdvancedTerraform"
    Week        = "8"
    ManagedBy   = "Terraform"
    Environment = terraform.workspace
  }
}

module "network" {
  source = "./modules/vpc"

  vpc_name             = "week8-vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]

  tags = local.common_tags
}

module "compute" {
  source = "./modules/ec2"

  vpc_id        = module.network.vpc_id
  subnet_ids    = module.network.public_subnet_ids
  key_name      = var.key_name
  instance_type = var.instance_type
}
