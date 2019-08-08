# Terraform module which creates ACM certificate resources on AWS.
#
# https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html

# https://www.terraform.io/docs/providers/aws/r/acm_certificate.html
resource "aws_acm_certificate" "default" {
  count = var.enabled ? 1 : 0

  # You can use a fully qualified domain name (FQDN) such as www.example.com
  # or a bare or apex domain name such as example.com.
  # https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html
  domain_name = var.domain_name

  # This is useful for protecting both a bare or apex domain (like example.com) and its subdomains (*.example.com).
  # https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html
  subject_alternative_names = var.subject_alternative_names

  # This module supports only DNS.
  validation_method = "DNS"

  # A mapping of tags to assign to the resource.
  tags = merge(
    {
      "Name" = var.domain_name
    },
    var.tags,
  )

  # It's recommended to specify create_before_destroy = true in a lifecycle block
  # to replace a certificate which is currently in use (eg, by aws_lb_listener).
  lifecycle {
    create_before_destroy = true
  }
}

# You add the CNAME records to your DNS database only once.
# ACM automatically renews your certificate as long as the certificate is in use and your CNAME record remains in place.
# https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html
#
# https://www.terraform.io/docs/providers/aws/r/route53_record.html
resource "aws_route53_record" "default" {
  count = var.enabled ? length(var.subject_alternative_names) + 1 : 0

  name    = aws_acm_certificate.default.0.domain_validation_options[count.index]["resource_record_name"]
  type    = aws_acm_certificate.default.0.domain_validation_options[count.index]["resource_record_type"]
  zone_id = var.zone_id
  records = [aws_acm_certificate.default.0.domain_validation_options[count.index]["resource_record_value"]]
  ttl     = var.ttl
}

# This resource is used together with aws_route53_record and aws_acm_certificate to request a DNS validated certificate,
# deploy the required validation records and wait for validation to complete.
#
# WARNING: This resource implements a part of the validation workflow.
# It does not represent a real-world entity in AWS, therefore changing or deleting this resource on its own has no immediate effect.
#
# https://www.terraform.io/docs/providers/aws/r/acm_certificate_validation.html
resource "aws_acm_certificate_validation" "default" {
  count = var.enabled ? 1 : 0

  certificate_arn         = aws_acm_certificate.default[0].arn
  validation_record_fqdns = aws_route53_record.default.*.fqdn

  timeouts {
    create = var.timeouts_create
  }
}
