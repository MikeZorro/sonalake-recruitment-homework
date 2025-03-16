resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets_cidr)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets_cidr[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets_cidr)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnets_cidr[count.index]

  tags = {
    Name = "private-subnet-${count.index}"
  }
}
