provider "aws" {
  region = "ap-south-1"
}

resource "aws_route_table" "route_table_public_test" {
  vpc_id = "vpc-05e8717f83fbc7f9b"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-07ffe86b9c6f58c41"
  }
  tags   = {
    Name = "route_table_public_test"
  }
}