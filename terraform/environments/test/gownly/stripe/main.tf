module "gownly_stripe" {
  source = "../../../../modules/gownly-stripe"

  environment            = var.environment
  aws_region             = var.aws_region
  common_tags            = var.common_tags
  stripe_publishable_key = var.stripe_publishable_key
  webhook_url            = var.webhook_url
  credit_packs           = length(var.credit_packs) > 0 ? var.credit_packs : null
}
