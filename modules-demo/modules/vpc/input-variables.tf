variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "vpc_tenancy" {
  description = "VPC tenancy as default or dedicated"
  type        = string
}

variable "vpc_tag_name" {
  description = "Tag name for the VPC"
  type        = string
}
