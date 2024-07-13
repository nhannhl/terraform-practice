resource "aws_instance" "lab5_ec2_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = var.user_data_path != null ? file(var.user_data_path) : null
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.subnet_id

  tags = {
    Name = "lab5_ec2_instance"
  }
}