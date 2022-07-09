resource "netlify_site" "dotboris_io" {
  name          = "dotboris-io"
  custom_domain = local.dotboris_io_domain


  lifecycle {
    ignore_changes = [
      # They have a build image but since we don't use their build we just let
      # it be whatever it wants to be
      build_image,
      # Collaborative deploy preview. No matter what I do it's always true
      cdp_enabled,
    ]
  }
}

resource "cloudflare_record" "dotboris_io" {
  zone_id = data.cloudflare_zone.dotboris_io.zone_id

  type  = "CNAME"
  name  = "@"
  value = local.netlify_loadbalancer_domain
}

resource "cloudflare_record" "www_dotboris_io" {
  zone_id = data.cloudflare_zone.dotboris_io.zone_id

  type  = "CNAME"
  name  = "www"
  value = local.netlify_loadbalancer_domain
}

output "dotboris_io_site_id" {
  value = netlify_site.dotboris_io.id
}
