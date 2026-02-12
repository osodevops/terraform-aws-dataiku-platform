resource "aws_secretsmanager_secret" "stripe_secret_key" {
  name = "${var.environment}/gownly/stripe/secret-key"

  tags = var.common_tags
}

resource "aws_secretsmanager_secret" "webhook_signing_secret" {
  count = var.webhook_url != "" ? 1 : 0

  name = "${var.environment}/gownly/stripe/webhook-signing-secret"

  tags = var.common_tags
}
