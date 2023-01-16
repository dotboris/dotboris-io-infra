resource "cloudflare_record" "site_verification" {
  count = var.google_site_verification_key == null ? 0 : 1

  zone_id = data.cloudflare_zone.dotboris_io.zone_id

  type  = "TXT"
  name  = local.dotboris_io_domain
  value = "google-site-verification=${var.google_site_verification_key}"
  ttl   = 1 * 60 * 60 # 1 hour in seconds
}
