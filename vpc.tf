resource "aws_vpc" "main" {
  cidr_block           = "192.168.0.0/16"

  tags = {
    Name = "ControleProdutoVPC"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 12, 1) # /28 (16 IPs totais, 8 utilizáveis)
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}


resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 11, 1) # /27 (32 IPs totais, 16 utilizáveis)
  availability_zone = "us-east-1a"

  tags = {
    Name = "PrivateSubnet"
  }
}

