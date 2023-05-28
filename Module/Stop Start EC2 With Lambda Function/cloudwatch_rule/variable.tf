#############_EVENT_RULE_#########################################
variable "event_name" {
  type        = string
  description = "The name of the rule. If omitted, Terraform will assign a random, unique name."
}

variable "schedule_expression" {
  type        = string
  description = "The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required. Can only be used on the default event bus. For more information, refer to the AWS documentation Schedule Expressions for Rules."
}

variable "event_bus_name" {
  type        = string
  description = "The name or ARN of the event bus to associate with this rule. If you omit this, the default event bus is used."
  default     = "default"
}

variable "event_pattern" {
  type        = string
  description = "The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details."
  default     = "schedule_expression"
}

variable "event_description" {
  type        = string
  description = "The description of the rule."
}

variable "is_enabled" {
  type        = string
  description = "Whether the rule should be enabled (defaults to true)."
  default     = true
}

variable "event_rule_tags" {
  type        = map(string)
  description = "Tags of event rule"
}

variable "event_target_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) associated with the role that is used for target invocation."
}

variable "lambda_function_name" {
  type        = string
  description = " Name of the Lambda function whose resource policy you are updating"
}