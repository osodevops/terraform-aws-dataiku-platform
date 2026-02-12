provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.common_tags
  }
}

provider "stripe" {
  # API key read from STRIPE_API_KEY environment variable
}
