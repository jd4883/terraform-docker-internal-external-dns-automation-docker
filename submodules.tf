module "external-dns" {
  count   = var.external_dns ? 1 : 0
  domain  = var.domain
  records = local.cnames
  source  = "jd4883/cname-generator/digitalocean"
}

module "internal-dns" {
  count      = var.internal_dns ? 1 : 0
  providers = {
    pihole.ns1 = pihole.ns1
    pihole.ns2 = pihole.ns2
   }
  domain     = var.domain
  private_ip = var.private_ip
  records    = local.cnames
  source     = "jd4883/dns-bind9/hashicorp"
}
  
 
module "ns1" {
  count         = var.internal_dns ? 1 : 0
  source        = "jd4883/internal-dns/pihole"
  providers     = { pihole = pihole.ns1 }
  parent_domain = var.domain
  a_records     = {}
  cnames        = local.cnames
}

module "ns2" {
  source        = "jd4883/internal-dns/pihole"
  count         = var.internal_dns ? 1 : 0
  providers     = { pihole = pihole.ns2 }
  parent_domain = var.domain
  a_records     = {}
  cnames        = local.cnames
  depends_on    = [module.ns1]
}
