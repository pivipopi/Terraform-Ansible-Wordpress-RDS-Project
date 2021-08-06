output "public_ip" {
  description = "Public IP inst"
  value       = aws_instance.my_instance.*.public_ip
}

output "elastic_ip" {
  description = "EIP of inst"
  value       = aws_eip.my_eip.*.public_ip
}
