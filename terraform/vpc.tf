resource "aws_vpc" "prod-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    name = "prod_vpc"
  }
}

resource "aws_subnet" "prod-subnet-public" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-1a"

  tags = {
    name = "prod-subnet-public"
  }
}

resource "aws_subnet" "prod-subnet-private-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-1a"

  tags = {
    name = "prod-subnet-private-1"
  }
}

resource "aws_subnet" "prod-subnet-private-2" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-west-1a"

  tags = {
    name = "prod-subnet-private-2"
  }
}