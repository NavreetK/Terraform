variable "region" {
  type = string
}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "security_group_name" {
  type = string
}

variable "domain"{
  type = string
}

variable "record_name"{
  type = string
}

variable "rds_instance_class"{
  type = string
}

variable "rds_engine"{
  type = string
}

variable "db_name"{
  type = string
}

variable "db_user"{
  type = string
}

variable "db_pass"{
  type = string
}