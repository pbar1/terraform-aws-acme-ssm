output "ssm_arn_cert" {
  description = "ARN of the ACME certificate in AWS SSM Parameter Store"
  value       = "${aws_ssm_parameter.cert.arn}"
}

output "ssm_arn_key" {
  description = "ARN of the ACME private key in AWS SSM Parameter Store"
  value       = "${aws_ssm_parameter.key.arn}"
}

output "ssm_arn_intermediate" {
  description = "ARN of the ACME intermediate certificate in AWS SSM Parameter Store"
  value       = "${aws_ssm_parameter.intermediate.arn}"
}

output "ssm_path_cert" {
  description = "Path name of the ACME certificate in AWS SSM Parameter Store"
  value       = "${aws_ssm_parameter.cert.arn}"
}

output "ssm_path_key" {
  description = "Path name of the ACME private key in AWS SSM Parameter Store"
  value       = "${aws_ssm_parameter.key.arn}"
}

output "ssm_path_intermediate" {
  description = "Path name of the ACME intermediate certificate in AWS SSM Parameter Store"
  value       = "${aws_ssm_parameter.intermediate.arn}"
}
