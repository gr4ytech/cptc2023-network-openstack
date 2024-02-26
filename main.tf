terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
  application_credential_id = var.credential_id
  application_credential_secret = var.credential_secret
  auth_url    = var.auth_url
  region      = var.region
}
