variable "allow_ssh_ip" {
  type = string
  description = "value of the allow ssh ip"
  default = "0.0.0.0/0"
}

variable "vpc_id" {
  type = string
  description = "value of the VPC ID"
}