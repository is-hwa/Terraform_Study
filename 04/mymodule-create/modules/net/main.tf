##############################
# * VPC 생성
# * IGW 생성 및 연결
# * PubSubnet 생성
# * Routing Table 생성 및 연결
##############################

##############################
# * VPC 생성
##############################
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

##############################
# * IGW 생성 및 연결
##############################
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my_IGW"
  }
}

##############################
# * PubSubnet 생성
##############################
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.Subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "myPubSub"
  }
}

##############################
# * Routing Table 생성 및 연결
##############################
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.example.id
}
