# Terraform AWS Provider Version 5
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  shared_config_files = [ "C:/Users/ADMIN/.aws/config" ]
  shared_credentials_files = [ "C:/Users/ADMIN/.aws/credentials" ]
  profile = "default"
}

# Create EC2 instance
# Resource key_pair
resource "aws_key_pair" "deployed-key" {
  key_name = "deployed-key"
  public_key = file("../keypair/ec2-keypair.pub")

  tags = {
    Name = "deployed-key"
  }
}

# Resource Security Group
resource "aws_security_group" "sg-web-httpd" {
  name = "web-httpd-sg"
  
  # Outbound rule
  egress {
    description = "All Access"
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rule
  ingress {
    description = "SSH Access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-web-httpd"
  }
}

# Resource EC2 Instance
resource "aws_instance" "web-httpd" {
  ami = var.ami_ids[var.region]
  instance_type = var.instance_type
  key_name = aws_key_pair.deployed-key.key_name
  user_data = file("../data/user_data.sh")
  security_groups = [ aws_security_group.sg-web-httpd.name ]

  tags = {
    Name = "web-httpd"
  }
}