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