output "public_sg_id" {
  value = aws_security_group.lab5_public_sg.id
}

output "private_sg_id" {
  value = aws_security_group.lab5_private_sg.id
}