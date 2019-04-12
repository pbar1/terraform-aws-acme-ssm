#--------------------------------------------------------------------
# Required
#--------------------------------------------------------------------

variable "registration_email" {
  description = "Email address used for the certificate request"
}

variable "common_name" {
  description = "Primary DNS domain the certificate will be recognized for"
}

variable "ssm_path_cert" {
  description = "Path to place the ACME certificate PEM in SSM Parameter Store"
}

variable "ssm_path_key" {
  description = "Path to place the ACME private key PEM in SSM Parameter Store"
}

variable "ssm_path_intermediate" {
  description = "Path to place the ACME intermediate certificate in SSM Parameter Store"
}

variable "route53_hosted_zone_id" {
  description = "ID of the Route 53 hosted zone to use for DNS challange"
}

#--------------------------------------------------------------------
# Optional
#--------------------------------------------------------------------

variable "tags" {
  description = "Tags to apply to AWS resources"
  type        = "map"
  default     = {
    ManagedBy = "Terraform"
  }
}

variable "acme_provider_url" {
  description = "URL of the ACME provider to request certs from"
  default     = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "dns_challenge_provider" {
  description = "DNS provider used to verify ownership of the common name"
  default     = "route53"
}

variable "subject_alternative_names" {
  description = "Other DNS domains the cert vill be valid for"
  type        = "list"
  default     = []
}

variable "ssm_kms_key_id" {
  description = "KMS key ID used to encrypt the private key in SSM Parameter Store"
  default     = ""
}
