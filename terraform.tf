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
      version = "~> 5.97.0"
    }
  }
  required_version = ">= 1.1.0"
}
