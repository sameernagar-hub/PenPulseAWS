# Add internet gateway
resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    name = "prod-igw"
  }
}

# Public routes
resource "aws_route_table" "prod_public-crt" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    name = "prod-public-crt"
  }
}

resource "aws_route" "prod-public-r" {
  route_table_id = aws_route_table.prod_public-crt.id

  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.prod-igw.id
}

resource "aws_route_table_association" "prod-crta-public-subnet" {
  subnet_id      = aws_subnet.prod-subnet-public.id
  route_table_id = aws_route_table.prod_public-crt.id
}

# Private routes
resource "aws_route_table" "prod_private-crt" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    name = "prod-private-crt"
  }
}

resource "aws_route" "prod-private-r" {
  route_table_id = aws_route_table.prod_private-crt.id

  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.prod-nat-gateway.id
}

resource "aws_route_table_association" "prod-crta-private-subnet-1" {
  subnet_id      = aws_subnet.prod-subnet-private-1.id
  route_table_id = aws_route_table.prod_private-crt.id
}
resource "aws_route_table_association" "prod-crta-private-subnet-2" {
  subnet_id      = aws_subnet.prod-subnet-private-2.id
  route_table_id = aws_route_table.prod_private-crt.id
}

# NAT Gateway
resource "aws_eip" "nat-gateway" {
  vpc = true
}

resource "aws_nat_gateway" "prod-nat-gateway" {
  allocation_id = aws_eip.nat-gateway.id
  subnet_id     = aws_subnet.prod-subnet-public.id

  tags = {
    name = "VPC NAT"
  }

  depends_on = [aws_internet_gateway.prod-igw]
}