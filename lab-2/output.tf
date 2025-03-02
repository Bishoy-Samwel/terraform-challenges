output bastion_public_ip  {
  value       = aws_instance.bastion.public_ip
#   sensitive   = true
#   description = "description"
  depends_on  = []
}
