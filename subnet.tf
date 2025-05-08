resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidr_block)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subnet_cidr_block, count.index)
  availability_zone = element(var.az_sb, count.index)
  tags = {
    Name        = "${var.public_subnet_name}-${count.index + 1}"
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidr_block)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet_cidr_block, count.index)
  availability_zone = element(var.az_sb, count.index)
  tags = {
    Name        = "${var.private_subnet_name}-${count.index + 1}"
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}