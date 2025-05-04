resource "aws_s3_bucket" "meu-bucket" {
  bucket = "bucket-control-product-987654321"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
