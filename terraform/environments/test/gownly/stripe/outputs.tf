output "product_id" {
  description = "Stripe product ID for Gownly Credits"
  value       = module.gownly_stripe.product_id
}

output "price_ids" {
  description = "Map of credit pack name to Stripe price ID"
  value       = module.gownly_stripe.price_ids
}

output "webhook_endpoint_id" {
  description = "Stripe webhook endpoint ID"
  value       = module.gownly_stripe.webhook_endpoint_id
}

output "ssm_parameter_arns" {
  description = "ARNs of SSM parameters"
  value       = module.gownly_stripe.ssm_parameter_arns
}

output "secretsmanager_secret_arns" {
  description = "ARNs of Secrets Manager secrets"
  value       = module.gownly_stripe.secretsmanager_secret_arns
}
