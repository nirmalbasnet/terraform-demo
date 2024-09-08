provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "vpc_test" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"
}