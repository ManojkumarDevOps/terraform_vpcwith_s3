resource "aws_security_group" "allow_tls" {
  name        = var.aws_sg_name
  description = var.aws_sg_description
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.aws_ingress_ports
    content {
      from_port   = tonumber(ingress.value)
      to_port     = tonumber(ingress.value)
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.aws_sg_name
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}