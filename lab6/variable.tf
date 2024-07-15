variable "region" {
  type = string
  description = "value of the region"
}

variable "vpc_cidr" {
  type = string
  description = "value of the CIDR"
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "value of the public subnet CIDR"
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "value of the private subnet CIDR"
}

variable "vpc_az" {
  type = list(string)
  description = "value of the availability zones"
}

