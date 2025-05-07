resource "aws_vpc" "main" {
  cidr_block         = var.vpc_cidr_block
  enable_dns_support = true
  tags = {
    Name        = var.vpc_name
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}