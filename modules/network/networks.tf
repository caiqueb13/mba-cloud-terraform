# Criação da VPC

resource "aws_vpc" "vpc_projeto" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC-Projeto"
  }
}

# Subnet pública 1

resource "aws_subnet" "projeto-sub1" {
  vpc_id            = aws_vpc.vpc_projeto.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public-Subnet-1a"
  }
}

# Subnet privada 1

resource "aws_subnet" "projeto-sub2" {
  vpc_id            = aws_vpc.vpc_projeto.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-Subnet-1a"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "vpc_projeto-igw" {
  vpc_id = aws_vpc.vpc_projeto.id

  tags = {
    Name = "Projeto-VPC-IGW"
  }
}


# Rota padrão para o Internet Gateway

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.vpc_projeto.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_projeto-igw.id
  }
  tags = {
    Name = "public-route"
  }
}

resource "aws_route_table_association" "public-sub-route" {
  subnet_id      = aws_subnet.projeto-sub1.id
  route_table_id = aws_route_table.public-route.id
}