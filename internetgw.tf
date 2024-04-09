resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.svpc.id
  tags = {
    Name = "gw"
  }
}