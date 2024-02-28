resource "openstack_networking_network_v2" "cptc-network" {
  name = "CPTC Network"
}

resource "openstack_networking_subnet_v2" "cptc-corp-subnet" {
  name = "Corp Net"
  network_id = openstack_networking_network_v2.cptc-network.id
  cidr = "10.0.0.0/24"
  ip_version = 4
  no_gateway = true
}

resource "openstack_networking_subnet_v2" "cptc-guest-subnet" {
  name = "Guest Net"
  network_id = openstack_networking_network_v2.cptc-network.id
  cidr = "10.0.200.0/24"
  ip_version = 4
  no_gateway = true
}

resource "openstack_networking_subnet_v2" "cptc-vdi-subnet" {
  name = "VDI Net"
  network_id = openstack_networking_network_v2.cptc-network.id
  cidr = "10.0.254.0/24"
  ip_version = 4
  no_gateway = true
}