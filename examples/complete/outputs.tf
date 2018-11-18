output "acm_certificate_id" {
  value = "${module.certificate.acm_certificate_id}"
}

output "acm_certificate_arn" {
  value = "${module.certificate.acm_certificate_arn}"
}

output "acm_certificate_domain_validation_options" {
  value = "${module.certificate.acm_certificate_domain_validation_options}"
}

output "route53_record_fqdns" {
  value = "${module.certificate.route53_record_fqdns}"
}

output "route53_record_names" {
  value = "${module.certificate.route53_record_names}"
}
