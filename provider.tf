terraform {
  required_providers {
    hostinger = {
      source  = "hostinger/hostinger"
      version = "0.1.6"
    }
  }
}

provider "hostinger" {
  api_token = var.api_token
}
