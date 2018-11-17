# Terraform module which creates ACM certificate resources on AWS.
#
# https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html

# https://www.terraform.io/docs/providers/aws/r/acm_certificate.html
resource "aws_acm_certificate" "default" {
  # You can use a fully qualified domain name (FQDN) such as www.example.com
  # or a bare or apex domain name such as example.com.
  # https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html
  domain_name = "${var.domain_name}"

  # This is useful for protecting both a bare or apex domain (like example.com) and its subdomains (*.example.com).
  # https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html
  subject_alternative_names = ["${var.subject_alternative_names}"]

  # This module supports only DNS.
  validation_method = "DNS"

  # A mapping of tags to assign to the resource.
  tags = "${var.tags}"

  # It's recommended to specify create_before_destroy = true in a lifecycle block
  # to replace a certificate which is currently in use (eg, by aws_lb_listener).
  lifecycle {
    create_before_destroy = true
  }
}
