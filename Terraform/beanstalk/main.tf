
provider "aws" {
  region = var.aws_region
}

resource "aws_elastic_beanstalk_application" "my_app" {
  name        = var.app_name
  description = "My Elastic Beanstalk Application"
}

resource "aws_elastic_beanstalk_environment" "my_env" {
  name               = var.env_name
  application        = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = var.solution_stack

  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "IamInstanceProfile"
      value     = var.env_value
    }
}

