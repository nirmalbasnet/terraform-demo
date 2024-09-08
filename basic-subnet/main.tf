provider "aws" {
  region = "ap-south-1"
}

resource "aws_subnet" "subnet_public_test" {
  vpc_id                  = "vpc-05e8717f83fbc7f9b"
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_private_test" {
  vpc_id     = "vpc-05e8717f83fbc7f9b"
  cidr_block = "10.0.0.128/25"
}