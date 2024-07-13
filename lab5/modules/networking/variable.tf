variable "vpc_cidr" {
  type = string
  description = "value of the VPC CIDR"
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "value of the public subnet CIDR"
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "value of the private subnet CIDR"
}

variable "availability_zones" {
  type = list(string)
  description = "value of the availability zones"
}