module "okta" {
  count    = var.okta_oauth ? 1 : 0
  domain   = var.domain
  email    = var.emails.0
  label    = var.name
  logo_uri = var.logo_url
  name     = lower(replace(replace("${var.name}_proxy", " ", "_"), "-", "_"))
  source   = "jd4883/oauth2-app-generator/okta"
  urls     = distinct(local.uris)
}

module "external-dns" {
  count   = var.external_dns ? 1 : 0
  domain  = var.domain
  records = distinct(local.cnames)
  source  = "jd4883/cname-generator/digitalocean"
}

module "internal-dns" {
  count      = var.internal_dns ? 1 : 0
  domain     = var.domain
  private_ip = var.private_ip
  records    = distinct(local.cnames)
  source     = "jd4883/dns-bind9/hashicorp"
}

module "oauth2" {
  cnames                = var.cnames
  count                 = var.okta_oauth ? 1 : 0
  customResponseHeaders = var.customResponseHeaders
  domain                = var.domain
  emails                = var.emails
  envars                = var.envars
  labels                = var.labels
  name                  = var.name
  networks              = var.networks
  okta                  = module.okta.0
  organizr_cname        = var.organizr_cname
  source                = "jd4883/oauth2-terraform-config-generator-docker/docker"
  STSSeconds            = var.STSSeconds
  upstream_url          = var.upstream_url
}
