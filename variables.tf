variable "domain_name" {
  type        = "string"
  description = "A domain name for which the certificate should be issued."
}

variable "subject_alternative_names" {
  default     = []
  type        = "list"
  description = "A list of domains that should be SANs in the issued certificate."
}

variable "tags" {
  default     = {}
  type        = "map"
  description = "A mapping of tags to assign to the resource."
}
