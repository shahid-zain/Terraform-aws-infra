provider "aws" {
  region = var.aws_region
}
#security group for the database
resource "aws_security_group" "database-sg" {
  name        = "Database-SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = var.from_port
    to_port         = var.to_port
    protocol        = var.protocol
    security_groups = [var.server_sg]
  }

  egress {
    from_port   = var.efrom_port
    to_port     = var.eto_port
    protocol    = var.eprotocol
    cidr_blocks = [var.cidr_blocks]
  }

  tags = {
    Name = "Database-SG"
  }
}
resource "aws_db_instance" "default" {
  identifier             = var.identifier
  allocated_storage      = var.storage_all
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = var.engine
  instance_class         = var.class
  name                   = var.name
  username               = var.uname
  password               = var.password
  skip_final_snapshot    = var.snap
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [var.subnet1_id, var.subnet2_id]

  tags = {
    Name = "My DB subnet group"
  }
}