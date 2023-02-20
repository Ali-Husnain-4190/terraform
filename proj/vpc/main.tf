resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.my_vpc
  }
}

resource "aws_subnet" "my_subnet" {
  cidr_block              = var.public_subnet_cidr
  vpc_id                  = aws_vpc.my_vpc.id
  map_public_ip_on_launch = true
  tags = {
    "Name" = var.public_subnet
  }
}
data "aws_availability_zones" "available" {}
resource "aws_subnet" "private_subnet_1" {
  cidr_block              = element(var.private_subnet_cidr, count.index)
  vpc_id                  = aws_vpc.my_vpc.id
  map_public_ip_on_launch = false
  count                   = 1
  #availability_zone       = element(var.availability_zones, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    "Name" = var.private_subnet_1
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_igw"
  }
}

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "public_rtb"
  }
}
resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "private_rtb"
  }
}
