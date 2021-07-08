output "read_policy_arn" {
  value       = aws_appautoscaling_policy.read_policy.arn
  description = "ARN of the read policy"
}

output "write_policy_arn" {
  value       = aws_appautoscaling_policy.write_policy.arn
  description = "ARN of the write policy"
}
