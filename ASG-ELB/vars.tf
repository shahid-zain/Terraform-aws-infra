variable "image_id" {
	default = "ami-0db45f8a2ad147ffc"
}
variable "vpc_security_group_ids" {
	default = "sg-0b820c355519c37c9"
}
variable "subnet1" {
	default = "subnet-0ef67009743be00b7"
}
variable "subnet2" {
	default = "subnet-0db826f9a6060bd43"
}
variable "vpc_id" {
	default = "vpc-004a8c5418ca275ec"
}
variable "aws_region" {
	default = "ca-central-1"
}
variable "name_prefix" {
	default = "foobar"
}
variable "instance_type" {
	default = "t2.micro"
}
variable "key_name" {
	default = "mykeypair"
}
variable "desired_capacity" {
	default = 1
}
variable "max_size" {
	default = 3
}
variable "min_size" {
	default = 1
}
variable "port" {
	default = 80
}
variable "name" {
	default = "Shahid-target-group"
}
variable "protocol" {
	default = "HTTP"
}
variable "elb_name" {
	default = "Shahid-LB"
}
variable "internal" {
	default = false
}
variable "type" {
	default = "forward"
}
variable "lb_type" {
	default = "application"
}