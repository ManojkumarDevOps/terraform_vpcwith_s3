provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "main_s3" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = local.Environment
    Bill        = local.Bill
    owner       = local.owner
  }
}


resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.main_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}
