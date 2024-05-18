# Create VPC empresa-a
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-empresa-A"
  }
}

resource "aws_vpc" "empresa_b" {
  cidr_block = "10.100.0.0/16"
  tags = {
    Name = "vpc-empresa-B"
  }
}

resource "aws_vpc" "empresa_c" {
  cidr_block = "10.200.0.0/16"
  tags = {
    Name = "vpc-empresa-C"
  }
}

# Enable VPC flow logs
resource "aws_flow_log" "main" {
  depends_on        = [aws_vpc.main]  # Ensure VPC is created before enabling flow logs
  #log_destination   = "arn:aws:logs:us-east-1:954819354314:log-group:/aws/vpc/flow-log-group"
  log_destination = "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/vpc/flow-log-group"
  log_destination_type = "cloud-watch-logs"
  traffic_type      = "ALL"
  vpc_id            = aws_vpc.main.id
  iam_role_arn = aws_iam_role.flow_logs_role.arn  # Replace with your IAM role ARN
}