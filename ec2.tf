# resource "aws_key_pair" "hoje_keypair" {
#   key_name   = "hoje"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLfPiR+4K3NOon0MBVBZrMZMYFBxKJaa9V+bSlQXCARoDe2+YA2TuToC6XVfDpCf8vqkAb5OYJqEJ3fAawGZKhCNbNSLejdnbd6ctNTnpDJyL3F3vZgu5BSF0YJYGtwB8wdvN46PDjBrfNhGW2R8Q8z/WMmNF0Yqy7qmg+fjpgYkYjjc4Zl7tw0scboIJN1qGPin+cvnT7S5soFiuPfWG5dbYMYJYPvBW2Xd62cFDoT30U7l0KqIWxF4F6wv0Ys2OqSLkIoCB16jkgd4umxmXusFtbmIU8WE4YZdjZHWpaGwSfVlP1Aex8FCo6vra7VtY1V1gbpvf9Jxq3Wx0L1xXn rpimentel@localhost"
# }

resource "aws_network_interface" "bastion_public_ip_int" {
  subnet_id   = aws_subnet.public_subnet_1.id
  private_ips = ["10.0.1.160"]
  security_groups = [aws_security_group.ssh_access.id]

  tags = {
    Name = "public_network_interface_bastion"
  }
}

resource "aws_network_interface" "Empresa-A_private_ip_int" {
  subnet_id   = aws_subnet.private_subnet_1.id
  private_ips = ["10.0.3.7"]
  security_groups = [aws_security_group.ssh_access.id]

  tags = {
    Name = "private_network_interface_Empresa-A"
  }
}

resource "aws_network_interface" "Empresa-B_private_ip_int" {
  subnet_id   = aws_subnet.empresa_b_subnet_private.id
  private_ips = ["10.100.1.250"]
  security_groups = [aws_security_group.ssh_access_sg_empresa-B.id]

  tags = {
    Name = "private_network_interface_Empresa-B"
  }
}

resource "aws_network_interface" "Empresa-C_private_ip_int" {
  subnet_id   = aws_subnet.empresa_c_subnet_private.id
  private_ips = ["10.200.1.33"]
  security_groups = [aws_security_group.ssh_access_sg_empresa-C.id]

  tags = {
    Name = "public_network_interface"
  }
}

resource "aws_network_interface" "Empresa-C-2_private_ip_int" {
  subnet_id   = aws_subnet.empresa_c_subnet_private.id
  private_ips = ["10.200.1.34"]
  security_groups = [aws_security_group.ssh_access_sg_empresa-C.id]

  tags = {
    Name = "public_network_interface"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.bastion.id
  allocation_id = aws_eip.ec2_bastion.id
}

resource "aws_instance" "bastion" {
    ami                                  = var.ami
    # associate_public_ip_address          = true
    availability_zone                    = var.az
    instance_type                        = var.instance_type
    key_name                             = var.key_name
    # subnet_id                            = aws_subnet.public_subnet_1.id
    network_interface {
      network_interface_id = aws_network_interface.bastion_public_ip_int.id
      device_index         = 0
    }
    tags                                 = {
        "Name" = "bastion"
    }
    tags_all                             = {
        "Name" = "bastion"
    }
    # vpc_security_group_ids               = [
    #     aws_security_group.ssh_access.id,
    # ]
}

resource "aws_instance" "Empresa-A" {
    ami                                  = var.ami
    availability_zone                    = var.az
    instance_type                        = var.instance_type
    key_name                             = var.key_name
    network_interface {
      network_interface_id = aws_network_interface.Empresa-A_private_ip_int.id
      device_index         = 0
    }
    tags                                 = {
        "Name" = "Empresa-A"
    }
    tags_all                             = {
        "Name" = "Empresa-A"
    }
}

resource "aws_instance" "Empresa-B" {
    ami                                  = var.ami
    availability_zone                    = var.az
    instance_type                        = var.instance_type
    key_name                             = var.key_name
    network_interface {
      network_interface_id = aws_network_interface.Empresa-B_private_ip_int.id
      device_index         = 0
    }
    tags                                 = {
        "Name" = "Empresa-B"
    }
    tags_all                             = {
        "Name" = "Empresa-B"
    }
}

resource "aws_instance" "Empresa-C" {
    ami                                  = var.ami
    availability_zone                    = var.az
    instance_type                        = var.instance_type
    key_name                             = var.key_name
    network_interface {
      network_interface_id = aws_network_interface.Empresa-C_private_ip_int.id
      device_index         = 0
    }
    tags                                 = {
        "Name" = "Empresa-C"
    }
    tags_all                             = {
        "Name" = "Empresa-C"
    }
    user_data = "${file("user-data-apache.sh")}"
}

resource "aws_instance" "Empresa-C-2" {
    ami                                  = var.ami
    availability_zone                    = var.az
    instance_type                        = var.instance_type
    key_name                             = var.key_name
    network_interface {
      network_interface_id = aws_network_interface.Empresa-C-2_private_ip_int.id
      device_index         = 0
    }
    tags                                 = {
        "Name" = "Empresa-C-2"
    }
    tags_all                             = {
        "Name" = "Empresa-C-2"
    }
    user_data = "${file("user-data-apache.sh")}"
}