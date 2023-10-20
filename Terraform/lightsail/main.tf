provider "aws" {
  region  = var.aws_region
}

resource "aws_lightsail_instance" "lightsail_instance" {
  name              = var.project_name                      
  availability_zone = "${var.aws_region}a"                  
  blueprint_id      = var.lightsail_blueprints["wordpress"] 
  bundle_id         = var.bundle_id                         
}

output "public_ip" {
  value = aws_lightsail_instance.lightsail_instance.public_ip_address
}