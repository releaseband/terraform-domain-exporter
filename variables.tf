variable "domain_list" {
  type        = string
  default     = "google.com"
  description = "list of domains to monitoring ny domain exporter"
}

variable "image_repository" {
  type        = string
  default     = "caarlos0/domain_exporter"
  description = "domain exporter image repository"
}

variable "image_tag" {
  type        = string
  default     = "v1.17.1"
  description = "domain exporter image tag"
}
