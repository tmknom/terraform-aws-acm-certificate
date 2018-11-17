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

output "route53_record_fqdn" {
  value       = "${aws_route53_record.default.fqdn}"
  description = "FQDN built using the zone domain and name."
}

output "route53_record_name" {
  value       = "${aws_route53_record.default.name}"
  description = "The name of the record."
}
