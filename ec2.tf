resource "aws_instance" "mine" {
  ami                    = "ami-084568db4383264d4"
  instance_type          = "t2.micro"
  key_name               = "terraform-ec2-key"
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("user_data.sh")
  tags = {
    Name        = var.ec2_name
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}