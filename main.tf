# Create public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Create private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Private Route Table"
  }
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

# Create private route table Empresa B
resource "aws_route_table" "private_route_table_empresa_b" {
  vpc_id = aws_vpc.empresa_b.id

  tags = {
    Name = "Empresa B - Private Route Table"
  }
}

resource "aws_route_table_association" "private_subnet_association_empresa_b" {
  subnet_id      = aws_subnet.empresa_b_subnet_private.id
  route_table_id = aws_route_table.private_route_table_empresa_b.id
}

# Create Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "InternetGateway"
  }
}

# Create NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet_1.id # Example, choose one of the public subnets for NAT

  tags = {
    Name = "NAT Gateway"
  }
}

# Create Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  #vpc = true //deprecated instead use domain
  domain = "vpc"
}

# Add NAT Gateway to private route table
resource "aws_route" "nat_gateway_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

resource "aws_route" "transit_gateway_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "10.100.0.0/16"
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "transit_gateway_route_empresa_b" {
  route_table_id         = aws_route_table.private_route_table_empresa_b.id
  destination_cidr_block = "10.0.0.0/16"
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}
