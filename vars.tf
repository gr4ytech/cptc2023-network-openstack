variable "credential_id" {
  type = string
  description = "Openstack Application Credential ID"
  validation {
    condition = can(regex("^[a-z0-9]{32}$", var.credential_id))
    error_message = "Your application credential provided did not meet the conditions of being 32 characters long or consisting of only lowercase letters and numbers"
  }
}

variable "credential_secret" {
  type = string
  description = "Openstack Application Credential Secret"
  sensitive = true
  validation {
    condition = can(regex("^[a-zA-Z0-9-_]{86}$", var.credential_secret))
    error_message = "Your application credential secret provided did not meet the conditions of being 86 characters long or consisting of hypens, underscores, upper or lowercase letters, and numbers"
  }
}

variable "auth_url" {
  type = string
  description = "Openstack Keystone auth url"
  default = "https://horizon.hackucf.org:5000/v3"
}

variable "region" {
  type = string
  description = "Openstack Region (AZ)"
  default = "hack-ucf-0"
}

variable "external_network" {
  type = string
  description = "Name of Openstack external (accessible) network"
  default = "External Network"
}

variable "kali_keypair" {
  type = string
  description = "Name of keypair to use to allow for external system access to the Kali box"
}