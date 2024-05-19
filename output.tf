# Output IDs of provisioned resources
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}

output "empresa_b_subnet_private_id" {
  value = aws_subnet.empresa_b_subnet_private.id
}

output "empresa_b_subnet_public_id" {
  value = aws_subnet.empresa_b_subnet_public.id
}

output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "private_route_table_id" {
  value = aws_route_table.private_route_table.id
}

output "empresa_b_private_route_table_id" {
  value = aws_route_table.private_route_table_empresa_b.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}

output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.transit_gateway.id
}

output "empresa_a_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.empresa_a_attachment.id
}

output "empresa_b_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.empresa_b_attachment.id
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "Empresa-A_private_ip" {
  value = aws_instance.Empresa-A.private_ip
}

output "Empresa-B_private_ip" {
  value = aws_instance.Empresa-B.private_ip
}

output "Empresa-C_private_ip" {
  value = aws_instance.Empresa-C.private_ip
}
