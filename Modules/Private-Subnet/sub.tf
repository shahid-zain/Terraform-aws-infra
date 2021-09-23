provider "aws" {
  region = var.aws_region
}
resource "aws_subnet" "private1" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet3_cidr
  map_public_ip_on_launch = "false"
  availability_zone = var.subnet3_az
  tags = {
    Name = "Shahid-private-1"
  }
}
resource "aws_subnet" "private2" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet4_cidr
  map_public_ip_on_launch = "false"
  availability_zone = var.subnet4_az
  tags = {
    Name = "Shahid-private-2"
  }
}
output "private1" {
  value = aws_subnet.private1.id
}
output "private2" {
  value = aws_subnet.private2.id
}