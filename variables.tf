variable "domain_name" {
  type        = "string"
  description = "A domain name for which the certificate should be issued."
}

variable "route53_record_zone_id" {
  type        = "string"
  description = "The ID of the hosted zone to contain this record."
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

variable "route53_record_ttl" {
  default     = "60"
  type        = "string"
  description = "The TTL of the record."
}
