variable "instance_tenancy" {
  description = "Define the tenancy of VPC"
  type        = string
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "app_vpc" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "app_vpc"
  }
}
