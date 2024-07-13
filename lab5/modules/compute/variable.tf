variable "ami_id" {
  type = string
  description = "value of the AMI"
}

variable "instance_type" {
  type = string
  description = "value of the instance type"
}

variable "user_data_path" {
  type = string
  description = "value of the user data"
  nullable = true
}

variable "key_name" {
  type = string
  description = "value of the key name"
}

variable "security_group_ids" {
  type = list(string)
  description = "value of the security group"
  nullable = false
}

variable "subnet_id" {
  type = string
  description = "value of the subnet"
  nullable = false
}

