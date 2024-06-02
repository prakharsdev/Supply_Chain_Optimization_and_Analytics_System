provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "supply_chain_data" {
  bucket = "supply-chain-data"
  acl    = "private"
}

resource "aws_s3_bucket_object" "data" {
  bucket = aws_s3_bucket.supply_chain_data.bucket
  key    = "data/input_data.csv"
  source = "path/to/local/data/input_data.csv"
  etag   = filemd5("path/to/local/data/input_data.csv")
}

resource "aws_rds_instance" "db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.3"
  instance_class       = "db.t2.micro"
  name                 = "supply_chain_db"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.postgres13"
  skip_final_snapshot  = true
}

output "s3_bucket" {
  value = aws_s3_bucket.supply_chain_data.bucket
}

output "db_endpoint" {
  value = aws_rds_instance.db.endpoint
}
