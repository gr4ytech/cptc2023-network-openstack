resource "openstack_networking_secgroup_v2" "cptc-kali-secgroup" {
  name = "kali Security Group"
}

resource "openstack_networking_secgroup_rule_v2" "cptc-kali-icmp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "icmp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.cptc-kali-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "cptc-kali-tcp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 0
  port_range_min = 0
  security_group_id = openstack_networking_secgroup_v2.cptc-kali-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "cptc-kali-udp" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "udp"
  remote_ip_prefix = "10.0.0.0/16"
  port_range_max = 0
  port_range_min = 0
  security_group_id = openstack_networking_secgroup_v2.cptc-kali-secgroup.id
}

resource "openstack_networking_port_v2" "cptc-kali-port" {
  depends_on = [ openstack_networking_secgroup_v2.cptc-kali-secgroup, openstack_networking_subnet_v2.cptc-corp-subnet ]
  name = "kali Port"
  network_id = openstack_networking_network_v2.cptc-network.id
  admin_state_up = true
  security_group_ids = [ openstack_networking_secgroup_v2.cptc-kali-secgroup.id ]

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.cptc-corp-subnet.id
    ip_address = "10.0.0.10"
  }
}

resource "openstack_networking_secgroup_v2" "external-kali-secgroup" {
  name = "External Kali Security Group"
}

resource "openstack_networking_secgroup_rule_v2" "external-kali-ssh" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "0.0.0.0/0"
  port_range_max = 22
  port_range_min = 22
  security_group_id = openstack_networking_secgroup_v2.external-kali-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "external-kali-vnc" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_ip_prefix = "0.0.0.0/0"
  port_range_max = 5900
  port_range_min = 5900
  security_group_id = openstack_networking_secgroup_v2.external-kali-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "external-kali-ping" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "icmp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.external-kali-secgroup.id
}


resource "openstack_networking_port_v2" "external-kali-port" {
  name = "External Kali port"
  security_group_ids = [ openstack_networking_secgroup_v2.external-kali-secgroup.id ]
  network_id = data.openstack_networking_network_v2.external_network.id
  admin_state_up = true
}

resource "openstack_compute_instance_v2" "kali" {
  name = "kali"
  flavor_id = data.openstack_compute_flavor_v2.linux-flavor.id
  key_pair = var.kali_keypair
  # Allows password ssh auth to kali with kali:kali along with the ssh key used
  user_data       = "#cloud-config\npassword: kali\nchpasswd: { expire: False }\nssh_pwauth: True"

  block_device {
    uuid = data.openstack_images_image_v2.kali.id
    source_type = "image"
    volume_size = 50
    destination_type = "volume"
    delete_on_termination = "true"
  }

  network {
    port = openstack_networking_port_v2.cptc-kali-port.id
  }

  network {
    port = openstack_networking_port_v2.external-kali-port.id
  }
}

output "kali-external-ip" {
   value = "${ openstack_compute_instance_v2.kali.network[1].fixed_ip_v4 }"

   depends_on = [ openstack_networking_secgroup_v2.external-kali-secgroup ]
}