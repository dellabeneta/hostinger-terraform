
resource "hostinger_vps" "vps" {
  plan           = var.plan
  data_center_id = var.region_id
  template_id    = var.template_id
  hostname       = var.hostname
  password       = var.password
  ssh_key_ids    = var.ssh_key_ids

  post_install_script_id = hostinger_vps_post_install_script.nginx.id

}