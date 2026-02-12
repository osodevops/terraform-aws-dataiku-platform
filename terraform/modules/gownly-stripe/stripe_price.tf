resource "stripe_price" "credit_pack" {
  for_each = var.credit_packs

  product     = stripe_product.gownly_credits.id
  currency    = "gbp"
  unit_amount = each.value.price_pence
  active      = each.value.active

  metadata = {
    pack_name   = each.key
    credits     = tostring(each.value.credits)
    environment = var.environment
    managed_by  = "terraform"
  }
}
