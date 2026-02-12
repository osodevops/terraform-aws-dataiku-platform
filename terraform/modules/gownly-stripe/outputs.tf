output "product_id" {
  description = "Stripe product ID for Gownly Credits"
  value       = stripe_product.gownly_credits.id
}

output "price_ids" {
  description = "Map of credit pack name to Stripe price ID"
  value       = { for k, v in stripe_price.credit_pack : k => v.id }
}

output "price_id_small" {
  description = "Stripe price ID for the small credit pack"
  value       = stripe_price.credit_pack["small"].id
}

output "price_id_medium" {
  description = "Stripe price ID for the medium credit pack"
  value       = stripe_price.credit_pack["medium"].id
}

output "price_id_large" {
  description = "Stripe price ID for the large credit pack"
  value       = stripe_price.credit_pack["large"].id
}

output "webhook_endpoint_id" {
  description = "Stripe webhook endpoint ID (empty if not created)"
  value       = var.webhook_url != "" ? stripe_webhook_endpoint.gownly[0].id : ""
}

output "ssm_parameter_arns" {
  description = "ARNs of SSM parameters storing Stripe resource IDs"
  value = merge(
    { for k, v in aws_ssm_parameter.price_id : "price-id-${k}" => v.arn },
    {
      product-id      = aws_ssm_parameter.product_id.arn
      publishable-key = aws_ssm_parameter.publishable_key.arn
    }
  )
}

output "secretsmanager_secret_arns" {
  description = "ARNs of Secrets Manager secrets for Stripe keys"
  value = merge(
    { secret-key = aws_secretsmanager_secret.stripe_secret_key.arn },
    var.webhook_url != "" ? { webhook-signing-secret = aws_secretsmanager_secret.webhook_signing_secret[0].arn } : {}
  )
}
