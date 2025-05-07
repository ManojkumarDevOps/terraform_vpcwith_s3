resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = var.internet_gateway_name
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = var.route_table_name
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}
resource "aws_route" "public" {
  count                  = length(var.public_subnet_cidr_block)
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_internet_gateway.igw]
}