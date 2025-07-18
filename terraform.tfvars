aws_region                = "us-east-1"
bucket_name               = "my-backend-bucket-forstatelist0000001973878"
vpc_name                  = "My-vpc"
vpc_cidr_block            = "172.16.0.0/16"
public_subnet_cidr_block  = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24", "172.16.4.0/24"]
private_subnet_cidr_block = ["172.16.10.0/24", "172.16.20.0/24", "172.16.30.0/24", "172.16.40.0/24"]
az_sb                     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
public_subnet_name        = "my-public-subnet"
private_subnet_name       = "my-private-subnet"
route_table_namepublic    = "my-route_table"
internet_gateway_name     = "my-internet_gateway"
route_table_nameprivate   = "my-route_table_private"
aws_nat_gtw               = "my-nat_gateway"
aws_sg_name               = "my-security_group"
aws_sg_description        = "Allow all"
aws_ingress_ports         = ["22", "443", "80", "8080", "8443", "3306", "5432"]
ec2_name                  = "test_ec2"
