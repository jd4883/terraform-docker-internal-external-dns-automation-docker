module "external-dns" {
  count   = var.external_dns ? 1 : 0
  domain  = var.domain
  records = local.cnames
  source  = "jd4883/cname-generator/digitalocean"
}

module "internal-dns" {
  count      = var.internal_dns ? 1 : 0
  domain     = var.domain
  private_ip = var.private_ip
  records    = local.cnames
  source     = "jd4883/dns-bind9/hashicorp"
}