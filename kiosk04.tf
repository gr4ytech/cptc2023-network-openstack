resource "openstack_networking_secgroup_v2" "kiosk04-secgroup" {
  name = "kiosk04 Security Group"
}

resource "openstack_networking_secgroup_rule_v2" "kiosk04-icmp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "icmp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.kiosk04-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "kiosk04-tcp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 0
  port_range_min = 0
  security_group_id = openstack_networking_secgroup_v2.kiosk04-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "kiosk04-udp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "udp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 0
  port_range_min = 0
  security_group_id = openstack_networking_secgroup_v2.kiosk04-secgroup.id
}

resource "openstack_networking_port_v2" "kiosk04-port" {
  depends_on = [ openstack_networking_secgroup_v2.kiosk04-secgroup, openstack_networking_subnet_v2.cptc-guest-subnet ]
  name = "kiosk04 Port"
  network_id = openstack_networking_network_v2.cptc-network.id
  admin_state_up = true
  security_group_ids = [ openstack_networking_secgroup_v2.kiosk04-secgroup.id ]

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.cptc-guest-subnet.id
    ip_address = "10.0.200.104"
  }
}

resource "openstack_compute_instance_v2" "kiosk04" {
  name = "kiosk04"
  flavor_id = data.openstack_compute_flavor_v2.windows-flavor.id

  block_device {
    uuid = data.openstack_images_image_v2.cptc-kiosk04.id
    source_type = "image"
    volume_size = 50
    destination_type = "volume"
    delete_on_termination = "true"
  }

  network {
    port = openstack_networking_port_v2.kiosk04-port.id
  }
}