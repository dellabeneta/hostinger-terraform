
resource "hostinger_vps" "box" {
  plan           = "kvm2"
  data_center_id = var.region_id
  template_id    = var.template_id
  hostname       = var.hostname
  password       = var.password

  post_install_script_id = hostinger_vps_post_install_script.nginx.id
  ssh_key_ids            = [280072]
}