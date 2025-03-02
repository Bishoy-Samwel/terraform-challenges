output bastion_public_ip  {
  value       = aws_instance.instances[0].public_ip
#   sensitive   = true
#   description = "description"
  depends_on  = []
}
