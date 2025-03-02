aws_region = "us-east-2"

vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

ami_id         = "ami-0fc82f4dabc05670b"
instance_type  = "t2.micro"
instance_count = 3

subnets = [
  {
    name = "public-subnet-1"
    cidr_block = "10.0.1.0/24"
    type = "public"
  },
  {
    name = "public-subnet-2"
    cidr_block = "10.0.2.0/24"
    type = "public"
  },
  {
    name = "private-subnet-1"
    cidr_block = "10.0.3.0/24"
    type = "private"
  },
  {
    name = "private-subnet-2"
    cidr_block = "10.0.4.0/24"
    type = "private"
  }
]

instances = [
  {
    name = "bastion"
    subnet_name = "public-subnet-1"
  },
  {
    name = "application"
    subnet_name = "private-subnet-1"
  }
]