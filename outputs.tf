output "acm_certificate_id" {
  value       = "${aws_acm_certificate.default.id}"
  description = "The ARN of the certificate."
}

output "acm_certificate_arn" {
  value       = "${aws_acm_certificate.default.arn}"
  description = "The ARN of the certificate."
}

output "acm_certificate_domain_validation_options" {
  value       = "${aws_acm_certificate.default.domain_validation_options}"
  description = "A list of attributes to feed into other resources to complete certificate validation. Only set if DNS-validation was used."
}
