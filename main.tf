provider "acme" {
  server_url = "${var.acme_provider_url}"
}

provider "aws" {}

resource "tls_private_key" "account_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = "${tls_private_key.account_key.private_key_pem}"
  email_address   = "${var.registration_email}"
}

resource "acme_certificate" "certificate" {
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "${var.common_name}"
  subject_alternative_names = "${var.subject_alternative_names}"

  dns_challenge {
    provider = "route53"

    config {
      AWS_HOSTED_ZONE_ID = "${var.route53_hosted_zone_id}"
    }
  }
}

resource "aws_ssm_parameter" "cert" {
  name        = "${var.ssm_path_cert}"
  description = "ACME cert for ${var.common_name}"
  type        = "String"
  value       = "${acme_certificate.certificate.certificate_pem}"
  tags        = "${var.tags}"
}

resource "aws_ssm_parameter" "key" {
  name        = "${var.ssm_path_key}"
  description = "ACME private key for ${var.common_name}"
  type        = "SecureString"
  value       = "${acme_certificate.certificate.private_key_pem}"
  key_id      = "${var.ssm_kms_key_id}"
  tags        = "${var.tags}"
}

resource "aws_ssm_parameter" "intermediate" {
  name        = "${var.ssm_path_intermediate}"
  description = "ACME intermediate cert for ${var.common_name}"
  type        = "String"
  value       = "${acme_certificate.certificate.issuer_pem}"
  tags        = "${var.tags}"
}
