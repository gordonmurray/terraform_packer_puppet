variable "aws_account_id" {
  type = string
}

variable "default_instance_type" {
  type    = string
  default = "t2.medium"
}

variable "vpc" {
  type = string
}

variable "subnet" {
  type = string
}

variable "pem_key" {
  type    = string
  default = "puppet"
}

variable "profile" {
  type = string
}

variable "hosted_zone_id" {
  type = string
}

variable "domain_name" {
  type = string
}