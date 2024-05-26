resource "aws_lb" "example" {
  name               = "example-nlb"
  internal           = true
  load_balancer_type = "network" # Must be applicatio or network
  subnets            = [aws_subnet.empresa_b_subnet_private.id, aws_subnet.empresa_b_subnet_private_2.id]  # Replace with your subnets

  enable_deletion_protection = false

  tags = {
    Name = "example-nlb"
  }
}

resource "aws_lb_target_group" "example" {
  name        = "example-target-group"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.empresa_b.id  # Replace with your VPC ID

  target_type      = "ip"
  ip_address_type  = "ipv4"

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name = "example-target-group"
  }
}

resource "aws_lb_target_group_attachment" "example" {
  target_group_arn = aws_lb_target_group.example.arn
  target_id        = var.tg_ec2_1  # Replace with your target IP address
  port             = 80
  availability_zone = var.az_1a  # Replace with the appropriate AZ
}

resource "aws_lb_target_group_attachment" "example_2" {
  target_group_arn = aws_lb_target_group.example.arn
  target_id        = var.tg_ec2_2  # Replace with your target IP address
  port             = 80
  availability_zone = var.az_1a  # Replace with the appropriate AZ
}

resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.example.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.example.arn
  }
}
