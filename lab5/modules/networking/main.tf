# Create VPC
resource "aws_vpc" "lab5_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "lab5_vpc"
  }
}

# Create Public Subnet
resource "aws_subnet" "lab5_public_subnet_01" {
  vpc_id = aws_vpc.lab5_vpc.id
  cidr_block = var.public_subnet_cidr[0]
  availability_zone = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "lab5_public_subnet_01"
  }
}

resource "aws_subnet" "lab5_public_subnet_02" {
  vpc_id = aws_vpc.lab5_vpc.id
  cidr_block = var.public_subnet_cidr[1]
  availability_zone = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "lab5_public_subnet_02"
  }
}

# Create Private Subnet
resource "aws_subnet" "lab5_private_subnet_01" {
  vpc_id = aws_vpc.lab5_vpc.id
  cidr_block = var.private_subnet_cidr[0]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "lab5_private_subnet_01"
  }
}

resource "aws_subnet" "lab5_private_subnet_02" {
  vpc_id = aws_vpc.lab5_vpc.id
  cidr_block = var.private_subnet_cidr[1]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = "lab5_private_subnet_02"
  }
}

# Create IGW
resource "aws_internet_gateway" "lab5_igw" {
  vpc_id = aws_vpc.lab5_vpc.id

  tags = {
    Name = "lab5_igw"
  }
}

# Create EIP
resource "aws_eip" "lab5_eip" {
  domain = "vpc"

  tags = {
    Name = "lab5_eip"
  }
}

# Create NAT Gateway
resource "aws_nat_gateway" "lab5_nat_gateway" {
  allocation_id = aws_eip.lab5_eip.id
  subnet_id = aws_subnet.lab5_public_subnet_01.id

  tags = {
    Name = "lab5_nat_gateway"
  }
  
  depends_on = [ aws_internet_gateway.lab5_igw ]
}

# Create Public Route Table
resource "aws_route_table" "lab5_public_rtb" {
  vpc_id = aws_vpc.lab5_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab5_igw.id
  }

  tags = {
    Name = "lab5_public_rtb"
  }
}

resource "aws_route_table_association" "lab5_public_subnet_01_association" {
  subnet_id = aws_subnet.lab5_public_subnet_01.id
  route_table_id = aws_route_table.lab5_public_rtb.id
}

resource "aws_route_table_association" "lab5_public_subnet_02_association" {
  subnet_id = aws_subnet.lab5_public_subnet_02.id
  route_table_id = aws_route_table.lab5_public_rtb.id
}

# Create Private Route Table
resource "aws_route_table" "lab5_private_rtb" {
  vpc_id = aws_vpc.lab5_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.lab5_nat_gateway.id
  }

  tags = {
    Name = "lab5_private_rtb"
  }
}

resource "aws_route_table_association" "lab5_private_subnet_01_association" {
  subnet_id = aws_subnet.lab5_private_subnet_01.id
  route_table_id = aws_route_table.lab5_private_rtb.id
}

resource "aws_route_table_association" "lab5_private_subnet_02_association" {
  subnet_id = aws_subnet.lab5_private_subnet_02.id
  route_table_id = aws_route_table.lab5_private_rtb.id
}


