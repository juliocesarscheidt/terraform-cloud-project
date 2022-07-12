terraform {
  required_version = "~> 1.2.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "blackdevs"
    workspaces { name = "development" }
  }

  # using config.remote.tfbackend
  # backend "remote" {}

  # using local backend
  # backend "local" {
  # }
}

data "http" "request" {
  url = var.api_uri
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  api_request = jsondecode(data.http.request.body)
}

output "body" {
  value       = local.api_request
  sensitive   = false
  description = "API Request"
}

output "last" {
  value       = local.api_request["last"]
  sensitive   = false
  description = "API request"
}
