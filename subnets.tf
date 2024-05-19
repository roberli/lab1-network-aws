# Create public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PublicSubnet1-EmpresaA"
  }
}

# Create public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "PublicSubnet2-EmpresaA"
  }
}

# Create private subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PrivateSubnet1-EmpresaA"
  }
}

# Create private subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "PrivateSubnet2-EmpresaA"
  }
}

resource "aws_subnet" "empresa_b_subnet_public" {
  vpc_id            = aws_vpc.empresa_b.id
  cidr_block        = "10.100.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PublicSubnet1-EmpresaB"
  }
}

resource "aws_subnet" "empresa_b_subnet_private" {
  vpc_id            = aws_vpc.empresa_b.id
  cidr_block        = "10.100.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PrivateSubnet1-EmpresaB"
  }
}

resource "aws_subnet" "empresa_c_subnet_public" {
  vpc_id            = aws_vpc.empresa_c.id
  cidr_block        = "10.200.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PublicSubnet1-EmpresaC"
  }
}

resource "aws_subnet" "empresa_c_subnet_private" {
  vpc_id            = aws_vpc.empresa_c.id
  cidr_block        = "10.200.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PrivateSubnet1-EmpresaC"
  }
}