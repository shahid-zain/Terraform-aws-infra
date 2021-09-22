provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "example" {
    ami = var.ami_id
    count =
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.security_group]
    key_name = "mykeypair"

    tags = {
      Name = "Terraform-Created"
    }
    
}