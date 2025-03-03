instance_type  = "t2.micro"
instance_count = 3
subnets = [
  {
    name                   = "public-subnet-1"
    cidr_block             = "10.0.1.0/24"
    type                   = "public"
    map_public_ip_on_launch = true
  },
  {
    name                   = "public-subnet-2"
    cidr_block             = "10.0.2.0/24"
    type                   = "public"
    map_public_ip_on_launch = true
  },
  {
    name                   = "private-subnet-1"
    cidr_block             = "10.0.3.0/24"
    type                   = "private"
    map_public_ip_on_launch = false
  },
  {
    name                   = "private-subnet-2"
    cidr_block             = "10.0.4.0/24"
    type                   = "private"
    map_public_ip_on_launch = false
  }
]