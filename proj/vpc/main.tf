resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.my_vpc
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block              = var.public_subnet_cidr
  vpc_id                  = aws_vpc.my_vpc.id
  map_public_ip_on_launch = true
  tags = {
    "Name" = var.public_subnet
  }
}
resource "aws_subnet" "private_subnet_1" {
  cidr_block              = var.private_subnet_1_cidr
  vpc_id                  = aws_vpc.my_vpc.id
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags = {
    "Name" = var.private_subnet_1
  }
}
# resource "aws_subnet" "private_subnet_2" {
#   cidr_block              = var.private_subnet_2_cidr
#   vpc_id                  = aws_vpc.my_vpc.id
#   map_public_ip_on_launch = false

#   availability_zone = "us-east-1b"
#   tags = {
#     "Name" = var.private_subnet_2
#   }
# }
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_igw"
  }
}
resource "aws_route_table" "my_public_rtb" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "public route"
  }
}
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.my_public_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}
resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_public_rtb.id
}
resource "aws_route_table" "my_private" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "public route"
  }
}
# resource "aws_route" "default_route" {
#   route_table_id         = aws_route_table.my_public_rtb.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.gw.id
# }
resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.my_private.id
}
resource "aws_eip" "nat_gateway" {
  vpc = true
}
resource "aws_nat_gateway" "NGW" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "public subnet NAT gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
