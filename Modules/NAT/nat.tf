# TO Create NAT GATEWAY
provider "aws" {
  region = var.aws_region
}

resource "aws_eip" "nat" {
    vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.nat.id
    subnet_id = var.subnet_id
}
output "nat_id" {
  value = aws_nat_gateway.nat-gw.id
}
