resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = aws_vpc.empresa_b.id
  vpc_id        = aws_vpc.empresa_c.id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between Empresa B and Empresa C"
  }
}
