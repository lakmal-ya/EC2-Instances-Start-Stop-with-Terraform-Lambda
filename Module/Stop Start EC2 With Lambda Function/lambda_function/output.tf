output "lambda_function_arn" {
  description = "ARN of the Lambda Function"
  value       = aws_lambda_function.lambda_function.arn
}
