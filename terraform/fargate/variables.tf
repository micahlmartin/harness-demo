variable "name" {
  default = "micah-fargate-test"
}

variable "vpc_id" {
  default = "vpc-0e7bedb2e71dd8025"
}

variable "subnet_ids" {
  default = "subnet-0d3650898e5d4ca9a,subnet-03f25ce1cd0535df9"
}

variable "security_group_id" {
  default = "sg-011b1f285fb3c9be1"
}

variable "region" {
  default = "us-east-1"
}
