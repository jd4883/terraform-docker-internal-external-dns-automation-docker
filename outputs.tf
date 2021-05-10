output "do" { value = toset(try(module.external-dns.records.*, [])) }
output "okta" { value = try(toset(module.okta.*), []) }
