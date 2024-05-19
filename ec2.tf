resource "aws_instance" "bastion" {
    ami                                  = var.ami
    associate_public_ip_address          = true
    availability_zone                    = var.az
    instance_type                        = var.instance_type
    key_name                             = var.key_name
    subnet_id                            = aws_subnet.public_subnet_1.id
    tags                                 = {
        "Name" = "bastion"
    }
    tags_all                             = {
        "Name" = "bastion"
    }
    vpc_security_group_ids               = [
        aws_security_group.ssh_access.id,
    ]
}

resource "aws_instance" "Empresa-A" {
    ami                                  = var.ami
    availability_zone                    = var.az
    instance_type                        = var.instance_type
    key_name                             = var.key_name
    subnet_id                            = aws_subnet.private_subnet_1.id
    tags                                 = {
        "Name" = "Empresa-A"
    }
    tags_all                             = {
        "Name" = "Empresa-A"
    }
    vpc_security_group_ids               = [
        aws_security_group.ssh_access.id,
    ]
}

resource "aws_instance" "Empresa-B" {
    ami                                  = var.ami
    availability_zone                    = var.az
    instance_type                        = var.instance_type
    key_name                             = var.key_name
    subnet_id                            = aws_subnet.empresa_b_subnet_private.id
    tags                                 = {
        "Name" = "Empresa-B"
    }
    tags_all                             = {
        "Name" = "Empresa-B"
    }
    vpc_security_group_ids               = [
        aws_security_group.ssh_access_sg_empresa-B.id,
    ]
}

resource "aws_instance" "Empresa-C" {
    ami                                  = var.ami
    availability_zone                    = var.az
    instance_type                        = var.instance_type
    key_name                             = var.key_name
    subnet_id                            = aws_subnet.empresa_c_subnet_private.id
    tags                                 = {
        "Name" = "Empresa-C"
    }
    tags_all                             = {
        "Name" = "Empresa-C"
    }
    vpc_security_group_ids               = [
        aws_security_group.ssh_access_sg_empresa-C.id,
    ]
}
