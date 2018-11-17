output "acm_certificate_id" {
  value = "${module.acm.acm_certificate_id}"
}

output "acm_certificate_arn" {
  value = "${module.acm.acm_certificate_arn}"
}

output "acm_certificate_domain_validation_options" {
  value = "${module.acm.acm_certificate_domain_validation_options}"
}

output "route53_record_fqdn" {
  value = "${module.acm.route53_record_fqdn}"
}

output "route53_record_name" {
  value = "${module.acm.route53_record_name}"
}
