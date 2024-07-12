# Module resource key_pair
resource "aws_key_pair" "deployed-key" {
  key_name = "deployed-key"
  public_key = file(var.key_path)

  tags = {
    "Name" = "deployed-key"
  }
}