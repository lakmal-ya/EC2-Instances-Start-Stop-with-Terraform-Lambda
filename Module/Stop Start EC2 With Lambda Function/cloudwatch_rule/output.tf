output "aws_cloudwatch_event_rule_arn" {
  description = "aws cloudwatch event rule ARN"
  value       = aws_cloudwatch_event_rule.schedule_expression.arn
}

