variable "api_uri" {
  type        = string
  description = "API URI"
  default     = "https://api.bitpreco.com/btc-brl/ticker"
  validation {
    condition     = can(regex("^https://", var.api_uri))
    error_message = "The api_uri value must start with \"https://\""
  }
}
