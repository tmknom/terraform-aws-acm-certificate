module "certificate" {
  source                 = "../../"
  domain_name            = "${local.domain_name}"
  zone_id = "${data.aws_route53_zone.default.id}"
}

data "aws_route53_zone" "default" {
  name = "${local.domain_name}."
}

locals {
  domain_name = "example.com"
}
