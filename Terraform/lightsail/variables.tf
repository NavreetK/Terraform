variable "aws_region" {
  type = string
}

variable "project_name" {
  description = "Project's Names"
  type        = string
}

variable "bundle_id" {
  type        = string
  description = "Options for instance size"
}

variable "lightsail_blueprints" {
  type        = map(string)
  description = "The ID for a virtual private server image"
}  