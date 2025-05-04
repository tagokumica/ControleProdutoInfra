terraform {
  cloud {
    organization = "ControleProduto"
    workspaces {
      name = "ControleProdutoInfra"
    }
  }
  required_providers {
    aws = {
      source = "hashcorp/aws"
      version = "~> 3.28.0"
    }
  }
  required_version = ">= 1.1.0"
}
