resource "aws_instance" "instances" {
  count = length(var.instances)

  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnets[var.instances[count.index].subnet_name].id
  vpc_security_group_ids = [aws_security_group.internal_sg.id]

  tags = {
    Name = var.instances[count.index].name
  }

  provisioner "local-exec" {
    command = "echo ${var.instances[count.index].name} ${self.public_ip} > inventory-${count.index}"
  }
}