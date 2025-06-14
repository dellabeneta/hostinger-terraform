
variable "api_token" {
  type        = string
  description = "Token para a API da Hostinger"
}

variable "password" {
  type        = string
  description = "Senha do usuário ROOT do Linux"
}

variable "hostname" {
  type        = string
  description = "Hostname para a VPS"
}

variable "region_id" {
  type        = string
  description = "Região do Datacenter"
}

variable "template_id" {
  type        = string
  description = "Sistema Operacional da VPS"
}

variable "plan" {
  type        = string
  description = "Plano para a VPS"
}

variable "ssh_key_ids" {
  type        = list(number)
  description = "ID da chave cadastrada na Hostinger"
}

variable "domain" {
  type        = string
  description = "Nome de domínio FQDN obritário"
}