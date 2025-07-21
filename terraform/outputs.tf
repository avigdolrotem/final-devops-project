# Required outputs from the guide
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance for verification"
  value       = aws_instance.builder.public_ip
}

output "ssh_private_key_path" {
  description = "Path to the generated private SSH key"
  value       = local_file.private_key.filename
  sensitive   = true
}

output "ssh_key_name" {
  description = "Name of the AWS SSH key pair"
  value       = aws_key_pair.builder_key.key_name
}

output "security_group_id" {
  description = "Security group ID for reference"
  value       = aws_security_group.builder_sg.id
}

# Bonus: SSH command for easy connection
output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i ${local_file.private_key.filename} ubuntu@${aws_instance.builder.public_ip}"
}