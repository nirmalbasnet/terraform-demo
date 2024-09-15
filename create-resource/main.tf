provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "app_vpc" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "app_vpc"
  }
}

resource "aws_subnet" "app_public_subnet" {
  vpc_id                  = resource.aws_vpc.app_vpc.id
  cidr_block              = "10.0.0.0/25"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "app_public_subnet"
  }
}

resource "aws_subnet" "app_private_subnet" {
  vpc_id            = resource.aws_vpc.app_vpc.id
  cidr_block        = "10.0.0.128/25"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "app_private_subnet"
  }
}

resource "aws_internet_gateway" "app_internet_gateway" {
  vpc_id = resource.aws_vpc.app_vpc.id

  tags = {
    Name = "app_internet_gateway"
  }
}

resource "aws_route_table" "app_public_route_table" {
  vpc_id = resource.aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0" #Puclic internet
    gateway_id = resource.aws_internet_gateway.app_internet_gateway.id
  }

  tags = {
    Name = "app_public_route_table"
  }
}

resource "aws_route_table_association" "app_public_subnet_route_table" {
  subnet_id      = resource.aws_subnet.app_public_subnet.id
  route_table_id = resource.aws_route_table.app_public_route_table.id
}

resource "aws_security_group" "app_instance_security_group" {
  name        = "app_instance_security_group"
  description = "Security groups for instances"
  vpc_id      = resource.aws_vpc.app_vpc.id

  tags = {
    Name = "app_instance_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_instance_security_group_allow_all_inbound_traffic" {
  security_group_id = resource.aws_security_group.app_instance_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = {
    Name = "app_instance_security_group_allow_all_inbound_traffic"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_instance_security_group_allow_ssh" {
  security_group_id = resource.aws_security_group.app_instance_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "app_instance_security_group_allow_ssh"
  }
}

resource "aws_vpc_security_group_egress_rule" "app_instance_security_group_allow_all_outboubd_traffic" {
  security_group_id = resource.aws_security_group.app_instance_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = {
    Name = "app_instance_security_group_allow_all_outboubd_traffic"
  }
}

resource "aws_instance" "app_ec2" {
  ami             = "ami-0e53db6fd757e38c7"
  instance_type   = "t2.micro"
  subnet_id       = resource.aws_subnet.app_public_subnet.id
  key_name        = "ssh-key"
  security_groups = [resource.aws_security_group.app_instance_security_group.id]

  tags = {
    Name = "app_ec2"
  }
}

output "instance_public_ip" {
  value = aws_instance.app_ec2.public_ip
}

output "instance_public_dns" {
  value = aws_instance.app_ec2.public_dns
}
