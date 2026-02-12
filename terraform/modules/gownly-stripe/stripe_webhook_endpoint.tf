resource "stripe_webhook_endpoint" "gownly" {
  count = var.webhook_url != "" ? 1 : 0

  url = var.webhook_url

  enabled_events = [
    "checkout.session.completed",
    "payment_intent.succeeded",
    "payment_intent.payment_failed",
  ]

  metadata = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
