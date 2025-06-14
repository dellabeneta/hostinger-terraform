
resource "hostinger_vps_post_install_script" "docker" {
  name    = "Install Docker"
  content = <<-EOT
    #!/bin/bash
    
    # Remove old versions
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do 
      sudo apt-get remove -y $pkg 2>/dev/null || true
    done
    
    # Update and install prerequisites
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl
    
    # Add Docker's official GPG key and repository
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Install Docker
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    
    # Start Docker service
    sudo systemctl start docker
    sudo systemctl enable docker
    
    # Add user to docker group
    sudo usermod -aG docker ubuntu 2>/dev/null || true
    
    # Test installation with sudo
    sudo docker run hello-world
    
    echo "Docker installed! Reboot required for non-sudo docker usage."
  EOT
}