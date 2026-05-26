variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "key_name" {
  type    = string
  default = "my-key-pair"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "db_password" {
  type      = string
  sensitive = true
}