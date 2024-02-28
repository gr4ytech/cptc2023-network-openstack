resource "openstack_networking_secgroup_v2" "dc01-secgroup" {
  name = "dc01 Security Group"
}

resource "openstack_networking_secgroup_rule_v2" "dc01-icmp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "icmp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-ldap" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 389
  port_range_min = 389
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-ldap-udp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "udp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 389
  port_range_min = 389
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-global-catalog" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_min = 3268
  port_range_max = 3269
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-rpc" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 135
  port_range_min = 135
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-kerberos" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 88
  port_range_min = 88
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-kerberos-udp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "udp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 88
  port_range_min = 88
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-ldaps" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 636
  port_range_min = 636
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-kerberos-password" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 464
  port_range_min = 464
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-kerberos-password-udp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "udp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 464
  port_range_min = 464
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-ntp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 123
  port_range_min = 123
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-ntp-udp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "udp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 123
  port_range_min = 123
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-rpc-range" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_min = 49152
  port_range_max = 65535
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-adws" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 9389
  port_range_min = 9389
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-rdp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 3389
  port_range_min = 3389
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-dns" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 53
  port_range_min = 53
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "dc01-dns-udp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "udp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 53
  port_range_min = 53
  security_group_id = openstack_networking_secgroup_v2.dc01-secgroup.id
}

resource "openstack_networking_port_v2" "dc01-port" {
  depends_on = [ openstack_networking_secgroup_v2.dc01-secgroup, openstack_networking_subnet_v2.cptc-corp-subnet ]
  name = "dc01 Port"
  network_id = openstack_networking_network_v2.cptc-network.id
  admin_state_up = true
  security_group_ids = [ openstack_networking_secgroup_v2.dc01-secgroup.id ]

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.cptc-corp-subnet.id
    ip_address = "10.0.0.5"
  }
}

resource "openstack_compute_instance_v2" "dc01" {
  name = "dc01"
  flavor_id = data.openstack_compute_flavor_v2.windows-flavor.id

  block_device {
    uuid = data.openstack_images_image_v2.cptc-dc01.id
    source_type = "image"
    volume_size = 50
    destination_type = "volume"
    delete_on_termination = "true"
  }

  network {
    port = openstack_networking_port_v2.dc01-port.id
  }
}