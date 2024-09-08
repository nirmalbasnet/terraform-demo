provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2_instance_test" {
  ami           = "ami-0e53db6fd757e38c7"
  instance_type = "t2.micro"
  subnet_id     = "subnet-01bd4a566d8192d66"

  tags          = {
    Name        = "ec2_instance_test"
  }
}