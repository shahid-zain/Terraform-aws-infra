provider "aws" {
  region = var.aws_region
}
resource "aws_internet_gateway" "main-gw" { 
    vpc_id = var.vpc_id
    tags = {
      "Name" = "Rishi-IG"
    }
  
}
output "ig_id" {
  value = aws_internet_gateway.main-gw.id
}
output "ig" {
  value = aws_internet_gateway.main-gw
}