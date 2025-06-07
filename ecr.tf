resource "aws_ecr_repository" "api_product_repo" {
  name                 = "api-product"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}