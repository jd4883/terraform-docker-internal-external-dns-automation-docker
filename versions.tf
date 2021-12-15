terraform {
  required_providers {
    digitalocean = { source = "digitalocean/digitalocean" }
    pihole = {
      source = "ryanwholey/pihole"
      configuration_aliases = [
        pihole.ns1,
        pihole.ns2,
      ]
    }
  }
}
