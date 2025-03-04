locals {
  security_groups = {
    "internal-sg" = aws_security_group.internal_sg
    "ssh-sg"      = aws_security_group.ssh_sg
  }
}


resource "aws_security_group" "internal_sg" {
  name   = "internal-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
   
  }
}

resource "aws_security_group" "ssh_sg" {
  name = "ssh-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = []

}
}

resource "aws_security_group" "all_sgs" {
  for_each = local.security_groups
  name     = each.key
  vpc_id   = aws_vpc.main.id
}