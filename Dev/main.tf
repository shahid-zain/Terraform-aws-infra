# To Create VPC
module "my_vpc" {
    source = "../Modules/VPC"
    vpc_cidr = "10.3.0.0/16"
    aws_region = "ca-central-1" 
    vpc_id = module.my_vpc.vpc_id
}
# To Create Public Subnet
module "my_public_subnet" {
    source = "../Modules/Public-Subnet"
    vpc_id = module.my_vpc.vpc_id
    aws_region = "ca-central-1"
    subnet1_cidr = "10.3.1.0/24"
    subnet1_az = "ca-central-1a"
}

# To Create Private Subnet
module "my_private_subnet" {
    source = "../Modules/Private-Subnet"
    vpc_id = module.my_vpc.vpc_id
    aws_region = "ca-central-1"
    subnet2_cidr = "10.3.2.0/24"
    subnet2_az = "ca-central-1b"
}

# To Create Internet Gateway
module "my_ig" {
    source = "../Modules/IG"
    vpc_id = module.my_vpc.vpc_id
}

# To Create NAT Gateway
module "my_nat" {
    source = "../Modules/NAT"
    subnet_id = module.my_public_subnet.public1
    nat_ig = module.my_ig.ig
    
}
# To Create And Assosiate Route Table To Public Subnet
module "public_route" {
    source = "../Modules/Public-Route"
    aws_region = "ca-central-1"
    vpc_id = module.my_vpc.vpc_id
    ig_id = module.my_ig.ig_id
    subnet_id = module.my_public_subnet.public1
}
# To Create And Assosiate Route Table To Private Subnet
module "private_route" {
    source = "../Modules/Private-Route"
    aws_region = "ca-central-1"
    vpc_id = module.my_vpc.vpc_id
    nat_id = module.my_nat.nat_id
    subnet_id = module.my_private_subnet.private1
}

# Ro Create Security Groups With Port Open 22 & 80

module "my_security_group" {
    source = "../Modules/Security-Group"
    aws_region = "ca-central-1"
    vpc_id = module.my_vpc.vpc_id
    from_port = 22
    to_port = 22
    from_port2 = 80
    to_port2 = 80
}
# TO Create EC2 Instance

module "my_ec2" {
    source = "../Modules/EC2"
    aws_region = "ca-central-1"
    ami_id = "ami-0e28822503eeedddc"
    instance_type = "t2.micro"
    subnet_id = module.my_public_subnet.public1
    security_group = module.my_security_group.sgid
    count_num = 1
}

# TO Create Key-Pair

module "my_key" {
    source = "../Modules/Key-Pair"
    aws_region = "ca-central-1"
}
