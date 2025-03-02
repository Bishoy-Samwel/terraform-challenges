resource "aws_subnet" "subnets" {
  for_each = { for s in var.subnets : s.name => s }

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.type == "public" ? true : false

  tags = {
    Name = each.value.name
  }
}