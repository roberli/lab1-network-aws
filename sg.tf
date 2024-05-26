resource "aws_security_group" "ssh_access" {
  name        = "ssh_access_sg"
  vpc_id      = aws_vpc.main.id
  description = "Allow SSH access from my IP address"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.isp_ip_address}"] # Replace with your IP address in CIDR notation (e.g., "192.0.2.0/32")
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"] # Replace with your IP address in CIDR notation (e.g., "192.0.2.0/32")
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.100.0.0/16"] # Replace with your IP address in CIDR notation (e.g., "192.0.2.0/32")
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "MyISP_and_src_Network_VPC"
  }

}

# aws_security_group.ssh_access_sg_empresa-B:
resource "aws_security_group" "ssh_access_sg_empresa-B" {
    description = "ssh_access_sg_empresa-B"
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      description = "HTTPS ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] 
    }
    tags = {
      Name = "ssh_access_sg_empresa-B"
    }
    tags_all    = {}
    vpc_id      = aws_vpc.empresa_b.id
}

# aws_security_group.ssh_access_sg_empresa-C:
resource "aws_security_group" "ssh_access_sg_empresa-C" {
    description = "ssh_access_sg_empresa-C"
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      description = "HTTPS ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] 
    }
    tags = {
      Name = "ssh_access_sg_empresa-C"
    }
    tags_all    = {}
    vpc_id      = aws_vpc.empresa_c.id
}
