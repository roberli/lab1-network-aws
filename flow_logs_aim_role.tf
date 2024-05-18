# Create IAM role for VPC Flow Logs
resource "aws_iam_role" "flow_logs_role" {
  name               = "flow-logs-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Create IAM policy to grant permission to write logs to CloudWatch Logs
resource "aws_iam_policy" "flow_logs_policy" {
  name = "flow-logs-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Attach IAM policy to IAM role
resource "aws_iam_role_policy_attachment" "flow_logs_policy_attachment" {
  role       = aws_iam_role.flow_logs_role.name
  policy_arn = aws_iam_policy.flow_logs_policy.arn
}

