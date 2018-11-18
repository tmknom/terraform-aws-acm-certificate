output "acm_certificate_id" {
  value = "${module.acm.acm_certificate_id}"
}

output "acm_certificate_arn" {
  value = "${module.acm.acm_certificate_arn}"
}

output "acm_certificate_domain_validation_options" {
  value = "${module.acm.acm_certificate_domain_validation_options}"
}

output "route53_record_fqdns" {
  value = "${module.acm.route53_record_fqdns}"
}

output "route53_record_names" {
  value = "${module.acm.route53_record_names}"
}
