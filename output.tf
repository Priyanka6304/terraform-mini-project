output "server1_public_ip" {

  value = aws_instance.webserver1.public_ip
}

output "server2_public_ip" {
  value = aws_instance.webserver2.public_ip
}

output "server1_public_dns" {
  value = aws_instance.webserver1.public_dns
}

output "server2_public_dns" {
  value = aws_instance.webserver2.public_dns
}

output "server1_instance_id" {
  value = aws_instance.webserver1.id
}

output "server2_instance_id" {
  value = aws_instance.webserver2.id
}