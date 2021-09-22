# For Route Table
provider "aws" {
  region = var.aws_region
}

resource "aws_route_table" "main-private" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = var.nat_id
    }
    tags = {
        Name = "Shahid-Private-1"
    }
}

# For Route Association Private
resource "aws_route_table_association" "main-private-1-a" {
    subnet_id = var.subnet_id
    route_table_id = aws_route_table.main-private.id
}
