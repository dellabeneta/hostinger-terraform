
# resource "hostinger_vps" "vps" {
#   plan           = var.plan
#   data_center_id = var.region_id
#   template_id    = var.template_id
#   hostname       = var.hostname
#   password       = var.password
#   ssh_key_ids    = var.ssh_key_ids

#   post_install_script_id = hostinger_vps_post_install_script.nginx.id

# }

// exemplo para criação de 5 vps iguais

resource "hostinger_vps" "vps5" {
  count          = 5
  plan           = var.plan
  data_center_id = var.region_id
  template_id    = var.template_id
  hostname       = "server-${count.index + 1}.${var.domain}"
  password       = var.password
  ssh_key_ids    = var.ssh_key_ids

  post_install_script_id = hostinger_vps_post_install_script.nginx.id

}