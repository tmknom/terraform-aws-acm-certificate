module "certificate" {
  source      = "../../"
  domain_name = "${local.domain_name}"
  zone_id     = "${data.aws_route53_zone.default.id}"
}

data "aws_route53_zone" "default" {
  name = "${local.domain_name}."
}

locals {
  domain_name         = "${var.domain_name != "" ? var.domain_name : local.default_domain_name}"
  default_domain_name = "example.com"
}

variable "domain_name" {
  default     = ""
  type        = "string"
  description = "If TF_VAR_domain_name set in the environment variables, then use that value."
}
