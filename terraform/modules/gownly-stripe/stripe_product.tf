resource "stripe_product" "gownly_credits" {
  name = "Gownly Credits"

  metadata = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
