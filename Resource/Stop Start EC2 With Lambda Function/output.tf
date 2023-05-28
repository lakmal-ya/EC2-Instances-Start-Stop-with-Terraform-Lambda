output "aws_stop_cloudwatch_event_rule_arn" {
  description = "aws cloudwatch Stop event rule ARN"
  value       = module.aws_stop_cloudwatch_event_rule.aws_cloudwatch_event_rule_arn
}

output "aws_start_cloudwatch_event_rule_arn" {
  description = "aws cloudwatch Start event rule ARN"
  value       = module.aws_start_cloudwatch_event_rule.aws_cloudwatch_event_rule_arn
}

output "aws_stop_lambda_function" {
  description = "aws stop lambda function ARN"
  value       = module.aws_stop_lambda_function.lambda_function_arn
}

output "aws_start_lambda_function" {
  description = "aws start lambda function ARN"
  value       = module.aws_start_lambda_function.lambda_function_arn
}
