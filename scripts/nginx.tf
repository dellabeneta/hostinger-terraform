
resource "hostinger_vps_post_install_script" "nginx" {
  name    = "Install NGINX"
  content = <<-EOT
    #!/bin/bash
    apt update
    apt install -y nginx
  EOT
}