# define out put of variable

output "public_IP" {
  description = "public IP of Ec2 instance"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "public DNS of Ec2 instnace"
  value       = aws_instance.web.public_dns
}
