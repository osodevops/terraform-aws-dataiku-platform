variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["test", "prod"], var.environment)
    error_message = "Environment must be 'test' or 'prod'."
  }
}

variable "aws_region" {
  description = "AWS region for SSM Parameter Store and Secrets Manager"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to all AWS resources"
  type        = map(string)
  default     = {}
}

variable "stripe_publishable_key" {
  description = "Stripe publishable API key (pk_test_* or pk_live_*)"
  type        = string
  sensitive   = true
}

variable "webhook_url" {
  description = "URL for Stripe webhook endpoint. Leave empty to skip webhook creation."
  type        = string
  default     = ""
}

variable "credit_packs" {
  description = "Map of credit pack configurations"
  type = map(object({
    credits     = number
    price_pence = number
    active      = bool
  }))
  default = {
    small = {
      credits     = 5
      price_pence = 299
      active      = true
    }
    medium = {
      credits     = 15
      price_pence = 699
      active      = true
    }
    large = {
      credits     = 30
      price_pence = 999
      active      = true
    }
  }
}
