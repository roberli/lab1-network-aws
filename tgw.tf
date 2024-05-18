# Create a Transit Gateway
resource "aws_ec2_transit_gateway" "transit_gateway" {
  description = "Transit Gateway for Empresa A and Empresa B"
  tags = {
    Name = "tgw-us-east-1"
  }
}

# Create attachments for Empresa A and Empresa B VPCs
resource "aws_ec2_transit_gateway_vpc_attachment" "empresa_a_attachment" {
  subnet_ids         = [aws_subnet.private_subnet_1.id,aws_subnet.private_subnet_2.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.main.id
  tags = {
    Name = "tgw-attachment-empresa-A"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "empresa_b_attachment" {
  subnet_ids         = [aws_subnet.empresa_b_subnet_private.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.empresa_b.id
  tags = {
    Name = "tgw-attachment-empresa-B"
  }
}

