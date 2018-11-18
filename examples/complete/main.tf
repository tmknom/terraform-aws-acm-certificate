module "certificate" {
  source                 = "../../"
  domain_name            = "${local.domain_name}"
  route53_record_zone_id = "${data.aws_route53_zone.default.id}"

  route53_record_ttl = "120"

  subject_alternative_names = [
    "stg.${local.domain_name}",
    "dev.${local.domain_name}",
  ]

  tags = {
    Environment = "prod"
  }
}

data "aws_route53_zone" "default" {
  name = "${local.domain_name}."
}

locals {
  domain_name = "example.com"
}
