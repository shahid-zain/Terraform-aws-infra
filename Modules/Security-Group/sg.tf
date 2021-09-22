provider "aws" {
  region = var.aws_region
}
resource "aws_security_group" "allow-ssh" {
    vpc_id = var.vpc_id
    name = "allow-ssh"
    description = "Security group that allows ssh and all egress traffic"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = var.from_port2
        to_port = var.to_port2
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow-ssh"
    }
}
output "sgid" {
  value = aws_security_group.allow-ssh.id
}