variable "region" {
  type = string
  default = "ap-southeast-1"
  description = "value of the region"
}

variable "ami_ids" {
  type = map(string)
  description = "value of the AMI"
  default = {
    "ap-southeast-1" = "ami-01dca6b685b1c23b7"
    "ap-northeast-1" = "ami-01ae6169b82b38e3b"
  }
}

variable "instance_type" {
  type = string
  description = "value of the instance type"
  default = "t3.micro"
}

variable "user_data_path" {
  type = string
  description = "value of the user data"
  default = "../data/user_data.sh"
}

# Variable for key_pair module
variable "key_path" {
  type = string
  description = "Key pair for SSH path"
  default = "../keypair/ec2-keypair.pub"
}

# Variable for network module
variable "vpc_cidr" {
  type = string
  description = "value of the VPC CIDR"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "value of the public subnet CIDR"
  default = [ "10.0.0.0/22", "10.0.4.0/22" ]
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "value of the private subnet CIDR"
  default = [ "10.0.8.0/22", "10.0.12.0/22" ]
}

variable "availability_zone" {
  type = map(list(string))
  description = "value of the availability zone"
  default = {
    "ap-southeast-1" = ["ap-southeast-1a", "ap-southeast-1b"]
    "ap-northeast-1" = ["ap-northeast-1a", "ap-northeast-1c"]
  }
}