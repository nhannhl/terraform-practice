resource "aws_key_pair" "deployed_key" {
  key_name = "deployed_key"
  public_key = file(var.key_pair_path)

  tags = {
    Name = "deployed_key"
  }
}