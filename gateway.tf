resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.lap_vpc.id

    tags = {
        Name = "main"
    }
  
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.gw]
}