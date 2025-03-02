resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnets["public-subnet-1"].id
  vpc_security_group_ids = [aws_security_group.internal_sg.id]

  tags = {
    Name = "bastion"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory"
  }
}

resource "aws_instance" "application" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnets["private-subnet-1"].id
  vpc_security_group_ids = [aws_security_group.internal_sg.id]

  count = var.instance_count

  tags = {
    Name = "application ${count.index}"
  }
}