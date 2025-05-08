variable "aws_region" {}
variable "bucket_name" {}
variable "vpc_name" {}
variable "vpc_cidr_block" {}
variable "public_subnet_cidr_block" {}
variable "az_sb" {}
variable "private_subnet_cidr_block" {}
variable "public_subnet_name" {}
variable "private_subnet_name" {}
variable "route_table_namepublic" {}
variable "internet_gateway_name" {}
variable "route_table_nameprivate" {}
variable "aws_nat_gtw" {}
variable "aws_sg_name" {}
variable "aws_sg_description" {}
variable "aws_ingress_ports" {
  description = "List of allowed ingress ports"
  type        = list(string)
}