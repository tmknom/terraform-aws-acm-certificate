variable "domain_name" {
  type        = string
  description = "A domain name for which the certificate should be issued."
}

variable "zone_id" {
  type        = string
  description = "The ID of the hosted zone in which create validation records."
}

variable "subject_alternative_names" {
  default     = []
  type        = list(string)
  description = "A list of domains that should be Subject Alternative Names in the issued certificate."
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "ttl" {
  default     = 60
  type        = number
  description = "The TTL of the validation records."
}

variable "enabled" {
  default     = true
  type        = bool
  description = "Set to false to prevent the module from creating anything."
}

variable "timeouts_create" {
  default     = "5m"
  type        = string
  description = "How long to wait for a certificate to be issued."
}
