output "acm_certificate_id" {
  value       = join("", aws_acm_certificate.default.*.id)
  description = "The ARN of the certificate."
}

output "acm_certificate_arn" {
  value       = join("", aws_acm_certificate.default.*.arn)
  description = "The ARN of the certificate."
}

output "acm_certificate_domain_validation_options" {
  value       = flatten(aws_acm_certificate.default.*.domain_validation_options)
  description = "A list of attributes to feed into other resources to complete certificate validation."
}

output "route53_record_fqdns" {
  value       = aws_route53_record.default.*.fqdn
  description = "FQDN built using the zone domain and name."
}

output "route53_record_names" {
  value       = aws_route53_record.default.*.name
  description = "The name of the record."
}
