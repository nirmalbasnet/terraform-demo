provider "aws" {
  region = "ap-south-1"
}

resource "aws_internet_gateway" "internet_gateway_test" {
  vpc_id = "vpc-05e8717f83fbc7f9b"
  tags   = {
    Name = "internet_gateway_test"
  }
}