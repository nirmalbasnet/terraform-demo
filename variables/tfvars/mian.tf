provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "app_vpc" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "app_vpc"
  }
}
