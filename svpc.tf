resource "aws_vpc" "svpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  tags = {
    Name = "svpc"
    env  = "Dev"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.svpc.id


  cidr_block = each.value.cidr_block


  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  availability_zone = each.value.availability_zone


  tags = {
    Name = "s_public_subnet"
  }
  for_each = var.subnets
}
/*
resource "aws_subnet" "s_private_subnet" {
  vpc_id     = aws_vpc.svpc.id


  map_public_ip_on_launch = false


  availability_zone = "us-east-1e"


  cidr_block = var.cidr_block_private_subnet_ip_range


  tags = {
    Name = "private_subnet"
    Owner   = "sridhar"
  }

}
*/