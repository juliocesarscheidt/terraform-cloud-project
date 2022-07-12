terraform {
  required_version = "~> 1.2.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "blackdevs"
    workspaces { name = "development" }
  }

  # using config.remote.tfbackend
  # backend "remote" {}

  # backend "local" {
  # }
}

data "http" "request" {
  url = "https://api.bitpreco.com/btc-brl/ticker"
  request_headers = {
    Accept = "application/json"
  }
}

output "body" {
  value       = jsondecode(data.http.request.body)
  sensitive   = false
  description = "API request"
}

output "last" {
  value       = jsondecode(data.http.request.body)["last"]
  sensitive   = false
  description = "API request"
}

output "buy" {
  value       = jsondecode(data.http.request.body)["buy"]
  sensitive   = false
  description = "API request"
}

output "sell" {
  value       = jsondecode(data.http.request.body)["sell"]
  sensitive   = false
  description = "API request"
}
