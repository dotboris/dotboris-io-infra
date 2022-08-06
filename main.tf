terraform {
  backend "s3" {
    bucket = "dotboris-terraform-state"
    key    = "github.com/dotboris/dotboris-io-infra"
    region = "us-east-2"
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.20.0"
    }

    netlify = {
      source  = "Fantom-App/netlify"
      version = "0.7.10"
    }
  }
}

variable "cloudflare_email" {
  sensitive = true
}

variable "cloudflare_api_key" {
  sensitive = true
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

variable "netlify_token" {
  sensitive = true
}

provider "netlify" {
  token = var.netlify_token
}
