provider "aws" {
  region = "ap-south-1"
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = "subnet-01bd4a566d8192d66" 
  route_table_id = "rtb-07fe0cc8223191d5a"
}