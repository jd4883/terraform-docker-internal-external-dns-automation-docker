output "do" { value = try(module.external-dns.records.*, []) }
output "okta" { value = module.okta.* }
