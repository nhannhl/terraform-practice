variable "ami" {
  type = string
  description = "value of the AMI"
}

variable "instance_type" {
  type = string
  description = "value of the instance type"
}

variable "key_name" {
  type = string
  description = "value of the key name"
}

variable "security_group_id" {
  type = string
  description = "value of the security group id"
}

variable "user_data_path" {
  type = string
  description = "value of the user data"
}