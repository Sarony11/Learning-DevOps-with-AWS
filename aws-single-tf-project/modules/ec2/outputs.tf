output "app_eip" {
  value = aws_eip.aws_devops_web_eip.public_ip
}

output "app_instance_id" {
  value = aws_instance.aws_devops_web.id
}