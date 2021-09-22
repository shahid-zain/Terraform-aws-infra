provider "aws" {
  region = var.aws_region
}
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  tags = {
    Name = "shahid-vpc"
  }
}
output "vpc_id" {
  value = aws_vpc.main.id
}
