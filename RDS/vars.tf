variable "vpc_id" {
    default = "vpc-004a8c5418ca275ec"
}
variable "server_sg" {
    default = "sg-0b820c355519c37c9"
}
variable "identifier" {
    default = "shahid-db"
}
variable "subnet1_id" {
    default = "subnet-09173aafd0611970b"
}
variable "subnet2_id" {
    default = "subnet-0aeba918c7ef22cd8"
}
variable "aws_region" {
    default = "ca-central-1"
}
variable "from_port" {
    default = 3306
}
variable "to_port" {
    default = 3306
}
variable "protocol" {
    default = "tcp"
}
variable "efrom_port" {
    default = 32768
}
variable "eto_port" {
    default = 65535
}
variable "eprotocol" {
    default = "tcp"
}
variable "cidr_blocks" {
    default = "0.0.0.0/0"
}
variable "storage_all" {
    default = 20
}
variable "engine" {
    default = "mysql"
}
variable "class" {
    default = "db.t2.micro"
}
variable "name" {
    default = "mydatabase"
}
variable "uname" {
    default = "root"
}
variable "password" {
    default = "password"
}
variable "snap" {
    default = true
}
