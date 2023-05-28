resource "aws_cloudwatch_event_rule" "schedule_expression" {
  name                = var.event_name
  schedule_expression = var.schedule_expression
  event_bus_name      = var.event_bus_name
  event_pattern = jsonencode({
    detail-type = [
      var.event_pattern
    ]
  })
  description = var.event_description
  is_enabled  = var.is_enabled
  tags        = var.event_rule_tags
}

resource "aws_cloudwatch_event_target" "event_target" {
  rule = aws_cloudwatch_event_rule.schedule_expression.name
  arn  = var.event_target_arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_check" {
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.schedule_expression.arn
  statement_id  = "AllowExecutionFromCloudWatch"
}