/*
resource "aws_route_table" "s_public_route" {
    
  vpc_id = aws_vpc.svpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "public_route_sridhar"
    Owner = "sridhar"
  }
}


resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.s_public_subnet.id
  route_table_id = aws_route_table.s_public_route.id
}


resource "aws_route_table" "s_private_route" {
    
  vpc_id = aws_vpc.svpc.id


  tags = {
    Name = "private_route_sridhar"
    owner = "sridhar"
  }
}


resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.s_private_subnet.id
  route_table_id = aws_route_table.s_private_route.id
}
*/

