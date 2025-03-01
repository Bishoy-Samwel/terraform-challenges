resource "aws_instance" "bastion" {
  ami           = "ami-042e8287309f5df03" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_1.id
  security_groups = [aws_security_group.ssh_sg.name]

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "application" {
  ami           = "ami-042e8287309f5df03"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_1.id
  security_groups = [aws_security_group.internal_sg.name]

  tags = {
    Name = "application"
  }
}