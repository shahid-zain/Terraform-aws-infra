variable "aws_region" {
    default = "ca-central-1"
}
variable "vpc_id" {}
variable "from_port" {
    default = 22
}
variable "to_port" {
    default = 22
}
variable "from_port2" {
    default = 80
}
variable "to_port2" {
    default = 80
}