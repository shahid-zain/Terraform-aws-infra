# To Create Launch Template
provider "aws" {
  region = var.aws_region
}
resource "aws_launch_template" "foobar" {
  name_prefix   = var.name_prefix 
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.vpc_security_group_ids]
}

# To Create ASG Group
resource "aws_autoscaling_group" "bar" {
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  vpc_zone_identifier = [var.subnet1, var.subnet2]
  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}

# To create autoschedule

# To Create Target Group
resource "aws_lb_target_group" "test" {
  name     = var.name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

# To Create Elastic Load Balancer
resource "aws_lb" "external-elb" {
  name               = var.elb_name
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    = [var.vpc_security_group_ids]
  subnets            = [var.subnet1, var.subnet2]
  tags = {
    Name = "shahidelb"
  }
}

# To Attach The Target Group To ELB
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = var.type
    target_group_arn = aws_lb_target_group.test.arn
  }
}
