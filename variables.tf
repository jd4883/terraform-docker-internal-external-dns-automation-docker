variable "customResponseHeaders" { type = string }
variable "domain" { type = string }
variable "labels" {}
variable "logo_url" { type = string }
variable "name" { type = string }
variable "organizr_cname" { type = string }
variable "private_ip" { type = string }
variable "STSSeconds" { type = number }
variable "upstream_url" { type = string }
variable "emails" { type = list(string) }
variable "networks" { type = list(string) }
variable "envars" {}

variable "okta_oauth" {
  type    = bool
  default = false
}

variable "external_dns" {
  type    = bool
  default = false
}

variable "internal_dns" {
  type    = bool
  default = true
}

variable "cnames" {
  type    = list(string)
  default = []
}
