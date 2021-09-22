variable "subnet1_cidr" {
    default = "10.0.1.0/24"
}
variable "subnet2_cidr" {
    default = "10.0.2.0/24"
}

variable "subnet1_az" {
    default = "ca-central-1a"
}
variable "subnet2_az" {
    default = "ca-central-1b"
}
variable "aws_region" {
    default = "ca-central-1"
}
variable "vpc_id" {}
