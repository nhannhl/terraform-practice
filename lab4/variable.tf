# Configure variables
# Variable dựa trên điều kiện đầu vào của variable khác
variable "region" {
  type = string
  default = "ap-northeast-1"
}

variable "ami_ids" {
  type = map(string)
  default = {
    "ap-southeast-1" = "ami-01dca6b685b1c23b7"
    "ap-northeast-1" = "ami-01ae6169b82b38e3b"
  }
}

variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "value of the instance type"
}

variable "key_path" {
  type = string
  default = "../keypair/ec2-keypair.pub"
}

variable "user_data_path" {
  type = string
  default = "../data/user_data.sh"
}