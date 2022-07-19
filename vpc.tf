resource"aws_vpc" "lap_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.lap_vpc.id
    cidr_block = var.cidr_public

    tags = {
      "Name" = "Public"
    }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.lap_vpc.id
    cidr_block = var.cidr_private

    tags = {
      "Name" = "Private"
    }
}

resource "aws_subnet" "data" {
    vpc_id = aws_vpc.lap_vpc.id
    cidr_block = var.cidr_data

    tags = {
      "Name" = "Data"
    }
}

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

resource "aws_eip" "nat_eip" {
  vpc      = true

   tags = {
    Name = "NAT eip"
  }
}