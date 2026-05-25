variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}