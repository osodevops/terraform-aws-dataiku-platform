variable "environment" {
  description = "Deployment environment"
  type        = string
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
  description = "Stripe publishable API key"
  type        = string
  sensitive   = true
}

variable "webhook_url" {
  description = "URL for Stripe webhook endpoint"
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
  default = {}
}
