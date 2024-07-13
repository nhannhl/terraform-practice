output "vpc_id" {
  value = aws_vpc.lab5_vpc.id
}

output "public_subnet_id" {
  value = [
    aws_subnet.lab5_public_subnet_01.id,
    aws_subnet.lab5_public_subnet_02.id
  ]
}

output "private_subnet_id" {
  value = [
    aws_subnet.lab5_private_subnet_01.id,
    aws_subnet.lab5_private_subnet_02.id
  ]
}

output "private_nat_gateway_id" {
  value = aws_nat_gateway.lab5_nat_gateway.id
}

output "public_rtb_id" {
  value = aws_route_table.lab5_public_rtb.id
}

output "private_rtb_id" {
  value = aws_route_table.lab5_private_rtb.id
}