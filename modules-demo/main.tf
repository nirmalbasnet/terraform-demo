provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = var.vpc_cidr_block
  vpc_tenancy    = var.vpc_tenancy
  vpc_tag_name   = var.vpc_tag_name
}

output "output_vpc_id" {
  description = "The ID of the VPC created"
  value       = module.vpc.vpc_id
}
