variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
    condition     = can(regex("^t[23]\\..*", var.instance_type))
    error_message = "Instance type must be t2 or t3 family."
  }
}

variable "allowed_ports" {
  type    = list(number)
  default = [22, 80, 443]
}