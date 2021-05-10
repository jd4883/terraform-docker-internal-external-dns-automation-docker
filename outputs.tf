output "do" { value = toset(try(module.external-dns.records.*, [])) }
