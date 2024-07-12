resource "aws_instance" "web_server" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [ var.security_group_name ]
  user_data = file(var.user_data_path)

  tags = {
    Name = "Web Server"
  }
}