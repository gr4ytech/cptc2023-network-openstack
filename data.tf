# Regex for the images looks for CPTC2023 or CPTC 2023 with the ability to match images if they were
# directly uploaded from the cptc.rit.edu vm file share

data "openstack_images_image_v2" "cptc-adcs" {
  name_regex = "^(CPTC)\\s?2023.*?adcs.*?$"
}

data "openstack_images_image_v2" "cptc-dc01" {
  name_regex = "^(CPTC)\\s?2023.*?dc01.*?$"
}

data "openstack_images_image_v2" "cptc-doapi" {
  name_regex = "^(CPTC)\\s?2023.*?doapi.*?$"
}

data "openstack_images_image_v2" "cptc-hms" {
  name_regex = "^(CPTC)\\s?2023.*?hms.*?$"
}

data "openstack_images_image_v2" "cptc-kiosk01" {
  name_regex = "^(CPTC)\\s?2023.*?kiosk01.*?$"
}

data "openstack_images_image_v2" "cptc-kiosk02" {
  name_regex = "^(CPTC)\\s?2023.*?kiosk02.*?$"
}

data "openstack_images_image_v2" "cptc-kiosk03" {
  name_regex = "^(CPTC)\\s?2023.*?kiosk03.*?$"
}

data "openstack_images_image_v2" "cptc-kiosk04" {
  name_regex = "^(CPTC)\\s?2023.*?kiosk04.*?$"
}

data "openstack_images_image_v2" "cptc-ldap" {
  name_regex = "^(CPTC)\\s?2023.*?ldap.*?$"
}

data "openstack_images_image_v2" "cptc-lps" {
  name_regex = "^(CPTC)\\s?2023.*?lps.*?$"
}

data "openstack_images_image_v2" "cptc-media" {
  name_regex = "^(CPTC)\\s?2023.*?media.*?$"
}

data "openstack_images_image_v2" "cptc-ns01" {
  name_regex = "^(CPTC)\\s?2023.*?ns01.*?$"
}

data "openstack_images_image_v2" "cptc-payment-db" {
  name_regex = "^(CPTC)\\s?2023.*?payment[\\s-]?db.*?$"
}

data "openstack_images_image_v2" "cptc-payment-web" {
  name_regex = "^(CPTC)\\s?2023.*?payment[\\s-]?web.*?$"
}

data "openstack_images_image_v2" "cptc-profiler" {
  name_regex = "^(CPTC)\\s?2023.*?profiler.*?$"
}

data "openstack_images_image_v2" "cptc-workstation01" {
  name_regex = "^(CPTC)\\s?2023.*?workstation01.*?$"
}

data "openstack_images_image_v2" "cptc-workstation02" {
  name_regex = "^(CPTC)\\s?2023.*?workstation02.*?$"
}

# Switch kali for something else if you have a different preference
data "openstack_images_image_v2" "kali" {
  name_regex = "^[Kk]ali(?: \\d{4}\\.\\d)?$"
}

data "openstack_compute_flavor_v2" "windows-flavor" {
# For this network I would choose a flavor size with 2 vcpu and 4GB of ram minimum
# Our m1.large flavor has 2 vcpu and 4GB of ram for windows boxes
  name = "m1.large"
}

data "openstack_compute_flavor_v2" "linux-flavor" {
# Our network also uses linux boxes, these require less resources to run overall
# which makes the footprint of the network smaller. 
# Our m1.small flavor has 1 vcpu and 1GB of ram
  name = "m1.small"
}

data "openstack_networking_network_v2" "external_network" {
  name = var.external_network
}

data "openstack_networking_subnet_v2" "external_subnet" {
  network_id = data.openstack_networking_network_v2.external_network.id
}