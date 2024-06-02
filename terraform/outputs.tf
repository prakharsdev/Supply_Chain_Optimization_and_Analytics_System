output "s3_bucket" {
  value = aws_s3_bucket.supply_chain_data.bucket
}

output "db_endpoint" {
  value = aws_rds_instance.db.endpoint
}
