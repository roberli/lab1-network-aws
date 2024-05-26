variable "aws_region" {
  description = "The AWS region where resources will be provisioned"
  default     = "us-east-1" // Change this to your desired default region
}

variable "aws_account_id" {
  description = "The AWS account ID"
}

variable "isp_ip_address" {
  description = "The IP address of the ISP"
  type        = string
}

variable "ami" {
  description = "AMI from us-east-1 region for an Amazon Linux"
  type = string
}

variable "az" {
  description = "AZ us-east-1"
  type = string
}

variable "instance_type" {
  description = "Instance type to run the lab, on our case t2.micro is more than enough"
  type = string
}

variable "key_name" {
  description = "Key name generated to Lab to access the EC2 instances"
  type = string
}

variable "tg_ec2_1" {
  description = "Ip address of the first EC2 instance from the Target Group"
  type        = string
}

variable "tg_ec2_2" {
  description = "Ip address of the second EC2 instance from the Target Group"
  type        = string
}

variable "az_1a" {
  description = "Az necessary to apply to Target Group attachment work with remote IP Address"
  type        = string
}