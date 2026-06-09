#!/bin/bash

yum update -y
yum install -y httpd

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Terraform Project Server 2</title>
</head>
<body>
<h1>Terraform Project Server 2</h1>
<h2>Instance ID: $INSTANCE_ID</h2>
<p>Welcome to Terraform Training Project</p>
</body>
</html>
EOF

systemctl start httpd
systemctl enable httpd