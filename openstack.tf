provider "openstack" {
  user_name = "admin"
  password  = ""
  region    = "Region"
  auth_url  = "http://127.0.0.1/identity"
  tenant_id = "id"
  tenant_name = "tenant"
}

resource "openstack_compute_instance_v2" "local_instance" {
  name      = "local_instance"
  region    = "Region"
  image_id  = "image"
  flavor_id = "flavor"
  key_pair  = "keypair"
  security_groups = []
  network {
    uuid = "uuid"
    name = "network"
  }
}

output "openstack_instance" {
  value       = openstack_compute_instance_v2.local_instance
  sensitive   = true
  description = "Openstack Instance"
}
