#!/bin/bash
yum update -y
yum install httpd -y

TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/placement/availability-zone)
echo "<h1>Hello world from $(hostname -f) in AZ $AZ </h1>" > /var/www/html/index.html
systemctl enable httpd && systemctl start httpd
