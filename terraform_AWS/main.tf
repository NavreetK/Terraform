terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}


provider "aws" {
  region = var.region
}

resource "aws_instance" "Ubuntu_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  tags = {
    "Name" = "Ubuntu_instance"
  }
  security_groups = [aws_security_group.instances-sg.name]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > index.html
              python3 -m http.server 8080 &
              EOF
}


data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_security_group" "instances-sg" {
  name = "instance-security-group"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.alb-sg.id]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb-sg" {
  name = "alb-security-group"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_configuration" "launch-config" {
  name_prefix     = "launch-config"
  image_id        = var.ami
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instances-sg.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "terraform-asg" {
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.launch-config.name
  vpc_zone_identifier  = data.aws_subnet_ids.default_subnet.ids
}

resource "aws_lb_target_group" "terraform-tg" {
  name     = "example-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "group-attachment" {
  target_group_arn = aws_lb_target_group.terraform-tg.arn
  target_id        = aws_instance.Ubuntu_instance.id
  port            = 8080
}


resource "aws_lb" "load_balancer" {
  name               = "terraform-lb"
  load_balancer_type = "application"
  subnets            = data.aws_subnet_ids.default_subnet.ids
  security_groups    = [aws_security_group.alb-sg.id]

}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.load_balancer.arn

  port = 80

  protocol = "HTTP"

  default_action {
    type = "forward"
  target_group_arn = aws_lb_target_group.terraform-tg.arn
  }
}


resource "aws_route53_zone" "primary" {
  name = var.domain
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = aws_lb.load_balancer.dns_name
    zone_id                = aws_lb.load_balancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_db_instance" "db_instance" {
  allocated_storage   = 20
  instance_class      = var.rds_instance_class
  engine              = var.rds_engine
  name             = var.db_name
  username            = var.db_user
  password            = var.db_pass
  skip_final_snapshot = true
}

output "public_ip" {
  value = aws_instance.Ubuntu_instance.public_ip
}
output "rds_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}