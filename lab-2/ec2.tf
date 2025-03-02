resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.internal_sg.id]

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "application" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_1.id
   vpc_security_group_ids = [aws_security_group.internal_sg.id]

  tags = {
    Name = "application"
  }
}