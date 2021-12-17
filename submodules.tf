module "external-dns" {
  count   = var.external_dns ? 1 : 0
  domain  = var.domain
  records = local.cnames
  source  = "jd4883/cname-generator/digitalocean"
} 
 
module "ns1" {
  count         = var.internal_dns ? 1 : 0
  source        = "jd4883/internal-dns/pihole"
  providers     = { pihole = pihole.ns1 }
  parent_domain = var.domain
  a_records     = {}
  cnames        = { for i in formatlist("%s.${var.domain}", local.cnames) : i => var.local_domain } #var.domain }
}

module "ns2" {
  source        = "jd4883/internal-dns/pihole"
  count         = var.internal_dns ? 1 : 0
  providers     = { pihole = pihole.ns2 }
  parent_domain = var.domain
  a_records     = {}
  cnames        = { for i in formatlist("%s.${var.domain}", local.cnames) : i => var.local_domain } #var.domain }
  depends_on    = [module.ns1]
}
