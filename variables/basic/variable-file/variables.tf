variable "aws_region" {
  description = "Define the region of AWS"
  type        = string
}

variable "instance_tenancy" {
  description = "Define the tenancy of VPC"
  type        = string
  default     = "default"
}
