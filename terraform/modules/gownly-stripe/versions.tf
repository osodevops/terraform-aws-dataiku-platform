terraform {
  required_providers {
    stripe = {
      source  = "lukasaron/stripe"
      version = "~> 3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.8.0"
    }
  }
}
