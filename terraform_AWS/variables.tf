variable "region" {
  type = string
  default = "ca-central-1"
}

variable "ami" {
    type = string
    default = "ami-0ea18256de20ecdfc"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "security_group_name" {
  type = string
  default = "example-sg"
}

variable "domain"{
  type = string
  default = "ns99dev.link"
}

variable "record_name"{
  type = string
  default = "www"
}

variable "rds_instance_class"{
  type = string
  default = "db.t3.micro"
}

variable "rds_engine"{
  type = string
  default = "mysql"
}

variable "db_name"{
  type = string
  default = "mydb"
}

variable "db_user"{
  type = string
  default = "nsidhu"
}

variable "db_pass"{
  type = string
  default = "mydb2023"
}