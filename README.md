# terraform-docker-internal-external-dns-automation-docker
Small automation module that calls other submodules to automatically generate traefik configurations (v2 syntax), updates a internal dns server (tested with bind9 with and without a keypair attached), digitalocean (this can definitely be modified to use other providers, DO works very well with terraform and was a no brainer to setup and can forward any domain for free), and Okta oauth using a forward auth container intermediary. All pieces are intended to be called from a parent module (designed for docker but will work with other use-cases)

## NOTE: this readme is a WIP and will be updated with useful how-to information at a later time
