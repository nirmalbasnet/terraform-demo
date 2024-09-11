resource "aws_vpc" "test_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_tenancy

  tags = {
    Name = var.vpc_tag_name
  }
}
