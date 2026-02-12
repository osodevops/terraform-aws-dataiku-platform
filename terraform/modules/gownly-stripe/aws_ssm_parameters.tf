resource "aws_ssm_parameter" "price_id" {
  for_each = var.credit_packs

  name  = "/${var.environment}/gownly/stripe/price-id-${each.key}"
  type  = "String"
  value = stripe_price.credit_pack[each.key].id

  tags = var.common_tags
}

resource "aws_ssm_parameter" "product_id" {
  name  = "/${var.environment}/gownly/stripe/product-id"
  type  = "String"
  value = stripe_product.gownly_credits.id

  tags = var.common_tags
}

resource "aws_ssm_parameter" "publishable_key" {
  name  = "/${var.environment}/gownly/stripe/publishable-key"
  type  = "SecureString"
  value = var.stripe_publishable_key

  tags = var.common_tags
}
