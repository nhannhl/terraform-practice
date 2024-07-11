# Configure variables
variable "ami_id" {
  type = string
  default = "ami-01dca6b685b1c23b7"
  description = "value of the AMI"

  validation {
    condition = length(var.ami_id) > 4 && substr(var.ami_id, 0, 4) == "ami-"
    error_message = "The ami_id value must be a valid AMI ID."
  }
}

variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "value of the instance type"
}

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