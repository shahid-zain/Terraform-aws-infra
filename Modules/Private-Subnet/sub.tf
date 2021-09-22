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
output "private1" {
  value = aws_subnet.private1.id
}
