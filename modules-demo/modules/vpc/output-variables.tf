output "vpc_id" {
  description = "ID of the VPC created"
  value       = aws_vpc.test_vpc.id
}
