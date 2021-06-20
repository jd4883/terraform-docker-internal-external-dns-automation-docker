locals {
  cnames = distinct(concat(var.cnames, [var.name]))
  uris   = formatlist("https://%s.${var.domain}", local.cnames)
}
