provider "aws" {
  region = var.region
}

resource "aws_ecs_cluster" "cluster_1" {
  name = var.cluster_name
}

data "aws_vpc" "default_vpc" {
  default = true
}
data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_ecs_service" "service_1" {
  name = var.service_name
  cluster = aws_ecs_cluster.cluster_1.id
  task_definition = var.task_definition_arn
  desired_count = var.desired_count
  launch_type = "FARGATE"
}

resource "aws_ecs_task_definition" "default" {
  family = var.task_family
  network_mode = "awsvpc"
  cpu = var.cpu
  memory = var.memory
  container_definitions = var.container_definitions
}
resource "aws_ecs_container_definition" "default" {
  name = var.container_name
  image = var.image
  cpu = var.cpu
  memory = var.memory
  portMappings = var.port_mappings
}
