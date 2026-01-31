variable "private_subnet" {
  type        = list(string)
  default     = ["12.0.0.0/19", "12.0.32.0/19"]
  description = "private subnet"
}

variable "public_subnet" {
  type        = list(string)
  default     = ["12.0.64.0/19", "12.0.96.0/19"]
  description = "Public subnet"
}

variable "zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "clusters" {
  type    = list(string)
  default = ["dev", "prod"]
}