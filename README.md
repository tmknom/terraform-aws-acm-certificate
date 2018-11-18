# terraform-aws-acm-certificate

[![CircleCI](https://circleci.com/gh/tmknom/terraform-aws-acm-certificate.svg?style=svg)](https://circleci.com/gh/tmknom/terraform-aws-acm-certificate)
[![GitHub tag](https://img.shields.io/github/tag/tmknom/terraform-aws-acm-certificate.svg)](https://registry.terraform.io/modules/tmknom/acm-certificate/aws)
[![License](https://img.shields.io/github/license/tmknom/terraform-aws-acm-certificate.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module which creates ACM certificate resources on AWS.

## Usage

### Minimal

```hcl
module "certificate" {
  source      = "git::https://github.com/tmknom/terraform-aws-acm-certificate.git?ref=tags/1.0.0"
  domain_name = "example.com"
  zone_id     = "${aws_route53_zone.default.zone_id}"
}
```

### Complete

```hcl
module "certificate" {
  source      = "git::https://github.com/tmknom/terraform-aws-acm-certificate.git?ref=tags/1.0.0"
  domain_name = "example.com"
  zone_id     = "${aws_route53_zone.default.zone_id}"

  ttl = "120"

  subject_alternative_names = [
    "stg.example.com",
    "dev.example.com",
  ]

  tags = {
    Environment = "prod"
  }
}
```

## Examples

- [Minimal](https://github.com/tmknom/terraform-aws-acm-certificate/tree/master/examples/minimal)
- [Complete](https://github.com/tmknom/terraform-aws-acm-certificate/tree/master/examples/complete)

## Inputs

| Name                      | Description                                                                           |  Type  | Default | Required |
| ------------------------- | ------------------------------------------------------------------------------------- | :----: | :-----: | :------: |
| domain_name               | A domain name for which the certificate should be issued.                             | string |    -    |   yes    |
| zone_id                   | The ID of the hosted zone in which create validation records.                         | string |    -    |   yes    |
| subject_alternative_names | A list of domains that should be Subject Alternative Names in the issued certificate. |  list  |  `[]`   |    no    |
| tags                      | A mapping of tags to assign to the resource.                                          |  map   |  `{}`   |    no    |
| ttl                       | The TTL of the validation records.                                                    | string |  `60`   |    no    |

## Outputs

| Name                                      | Description                                                                           |
| ----------------------------------------- | ------------------------------------------------------------------------------------- |
| acm_certificate_arn                       | The ARN of the certificate.                                                           |
| acm_certificate_domain_validation_options | A list of attributes to feed into other resources to complete certificate validation. |
| acm_certificate_id                        | The ARN of the certificate.                                                           |
| route53_record_fqdns                      | FQDN built using the zone domain and name.                                            |
| route53_record_names                      | The name of the record.                                                               |

## Development

### Requirements

- [Docker](https://www.docker.com/)

### Configure environment variables

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=ap-northeast-1
```

### Installation

```shell
git clone git@github.com:tmknom/terraform-aws-acm-certificate.git
cd terraform-aws-acm-certificate
make install
```

### Makefile targets

```text
check-format                   Check format code
cibuild                        Execute CI build
clean                          Clean .terraform
docs                           Generate docs
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
release                        Release GitHub and Terraform Module Registry
terraform-apply-complete       Run terraform apply examples/complete
terraform-apply-minimal        Run terraform apply examples/minimal
terraform-destroy-complete     Run terraform destroy examples/complete
terraform-destroy-minimal      Run terraform destroy examples/minimal
terraform-plan-complete        Run terraform plan examples/complete
terraform-plan-minimal         Run terraform plan examples/minimal
upgrade                        Upgrade makefile
```

### Releasing new versions

Bump VERSION file, and run `make release`.

### Terraform Module Registry

- <https://registry.terraform.io/modules/tmknom/acm-certificate/aws>

## License

Apache 2 Licensed. See LICENSE for full details.
