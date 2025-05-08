resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = var.internet_gateway_name
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name        = "nat-eip"
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}

resource "aws_nat_gateway" "aws_nat" {
  connectivity_type = "public"
  allocation_id = aws_eip.nat.id
  subnet_id         = aws_subnet.public[0].id
  tags = {
    Name        = var.aws_nat_gtw
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = var.route_table_namepublic
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}
resource "aws_route" "publicr" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_internet_gateway.igw]
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = var.route_table_nameprivate
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}
resource "aws_route" "privater" {
  route_table_id = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.aws_nat.id
  depends_on     = [aws_nat_gateway.aws_nat]
}
resource "aws_route_table_association" "public-association" {
  count          = length(var.public_subnet_cidr_block)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "private-association" {
  count          = length(var.private_subnet_cidr_block)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id
}