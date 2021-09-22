variable "aws_region" {
    default = "ca-central-1"
}
variable "ami_id" {
    default = "ami-0e28822503eeedddc"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "subnet_id" {}
variable "security_group" {}

variable "count_num" {
    default = 1
}
