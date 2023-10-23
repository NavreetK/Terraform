provider "aws" {
  region = var.region
}

resource "aws_ecs_cluster" "cluster_1" {
  name = var.cluster_name
}

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
  availability_zone = var.zone
}

module "ecs-fargate" {
  source  = "umotif-public/ecs-fargate/aws"
  version = "~> 6.1.0"

  name_prefix        = "ecs-fargate-example"
  vpc_id             = data.aws_vpc.default_vpc.id
  private_subnet_ids = [data.aws_subnet.default_subnet.id]

  cluster_id = aws_ecs_cluster.cluster_1.id

  task_container_image   = "nginx:latest"
  task_definition_cpu    = 256
  task_definition_memory = 512

  task_container_port             = 80
  task_container_assign_public_ip = true

  load_balanced = false

  target_groups = [
    {
      target_group_name = "tg-fargate-example"
      container_port    = 80
    }
  ]

  health_check = {
    port = "traffic-port"
    path = "/"
  }
  tags = {
    Environment = "test"
    Project     = "Test"
  }

}

resource "aws_security_group_rule" "ecs_fargate_ingress" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  security_group_id = var.sg-id
  source_security_group_id = aws_security_group.default.id
}

resource "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default_vpc.id
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default_vpc.id
  name   = "default"
}