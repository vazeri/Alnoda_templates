terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  zone = "fr-par-1"
 }

locals {
  trusted = ["189.151.109.169"] #https://checkip.amazonaws.com/  Update as IP changes
}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_server" "web" {
  name              = "web-scaleway-1"
  type              = "DEV1-S"
  image             = "ubuntu_focal"
  ip_id             = scaleway_instance_ip.public_ip.id
  security_group_id = scaleway_instance_security_group.web.id
  
  root_volume {
    delete_on_termination = false
  }
  # additional_volume_ids = [ scaleway_instance_volume.data.id ]
}

resource "scaleway_instance_security_group" "web" {
  name        = "http & ssh"
  description = "allow HTTP and HTTPS traffic"
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port = 80
    ip_range = "0.0.0.0/0"
    protocol = "TCP"
  }

   inbound_rule {
    action = "accept"
    port = 443
    ip_range = "0.0.0.0/0"
    protocol = "TCP"
  }

 dynamic "inbound_rule" {       # ssh ubuntu@163.172.132.178 -i abc/.ssh/id_rsa.pub
    for_each = local.trusted
    content {
      action = "accept"
      port   = 22
      ip     = inbound_rule.value
    }
  }
}

#resource "scaleway_instance_volume" "data" {  #Attaches an additional disk drive
#  size_in_gb = 100
#  type = "b_ssd"
#}