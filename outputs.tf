output "do" { value = toset(try(module.external-dns.records.*, [])) }
output "okta" { value = toset(module.okta.*) }
