#############_STOP_CLOUDWATCH_EVENT_RULE_#########################################
variable "stop_cloudwatch_event_name" {
  type        = string
  description = "The name of the rule. If omitted, Terraform will assign a random, unique name."
}

variable "stop_cloudwatch_event_schedule_expression" {
  type        = string
  description = "The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required. Can only be used on the default event bus. For more information, refer to the AWS documentation Schedule Expressions for Rules. # Time will be the only support for UTC. Please check your time zone against UTC time before you set up the time."
}

variable "stop_cloudwatch_event_bus_name" {
  type        = string
  description = "The name or ARN of the event bus to associate with this rule. If you omit this, the default event bus is used."
}

variable "stop_cloudwatch_event_pattern" {
  type        = string
  description = "The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details."
  default     = "schedule_expression"
}

variable "stop_cloudwatch_event_description" {
  type        = string
  description = "The description of the rule."
}

variable "stop_cloudwatch_event_is_enabled" {
  type        = string
  description = "Whether the rule should be enabled (defaults to true)."
  default     = true
}

variable "stop_cloudwatch_event_rule_tags" {
  type        = map(string)
  description = "Tags of event rule"
}

#############_START_CLOUDWATCH_EVENT_RULE_#########################################
variable "start_cloudwatch_event_name" {
  type        = string
  description = "The name of the rule. If omitted, Terraform will assign a random, unique name."
}

variable "start_cloudwatch_event_schedule_expression" {
  type        = string
  description = "The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required. Can only be used on the default event bus. For more information, refer to the AWS documentation Schedule Expressions for Rules.# Time will be the only support for UTC. Please check your time zone against UTC time before you set up the time."
}

variable "start_cloudwatch_event_bus_name" {
  type        = string
  description = "The name or ARN of the event bus to associate with this rule. If you omit this, the default event bus is used."
  default     = "default"
}

variable "start_cloudwatch_event_pattern" {
  type        = string
  description = "The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details."
  default     = "schedule_expression"
}

variable "start_cloudwatch_event_description" {
  type        = string
  description = "The description of the rule."
}

variable "start_cloudwatch_event_is_enabled" {
  type        = string
  description = "Whether the rule should be enabled (defaults to true)."
  default     = true
}

variable "start_cloudwatch_event_rule_tags" {
  type        = map(string)
  description = "Tags of event rule"
}

#############_STOP_LAMBDA_FUNCTION_#########################################
variable "stop_lambda_function_name" {
  type        = string
  description = "Name of the Lambda function whose resource policy you are updating"
}

variable "stop_lambda_function_role" {
  description = "Amazon Resource Name (ARN) of the function's execution role. Provides the function's identity and access to AWS services and resources."
  type        = string
}

variable "stop_lambda_function_architectures" {
  description = "Instruction set architecture for your Lambda function. Only one of arm64 or x86_64 can be mentioned in the list"
  type        = list(string)
  default     = ["x86_64"]
}

variable "stop_lambda_function_description" {
  description = "Description of the Lambda function "
  type        = string
}

variable "stop_lambda_function_runtime" {
  description = "The runtime environment for the Lambda function. If deployment package is of .zip type , then runtime has to be specified mandatorily"
  type        = string
  validation {
    condition     = contains(["nodejs", "nodejs4.3", "nodejs6.10", "nodejs8.10", "nodejs10.x", "nodejs12.x", "nodejs14.x", "nodejs16.x", "java8", "java8.al2", "java11", "python2.7", "python3.6", "python3.7", "python3.8", "python3.9", "python3.10", "dotnetcore1.0", "dotnetcore2.0", "dotnetcore2.1", "dotnetcore3.1", "dotnet6", "nodejs4.3-edge", "go1.x", "ruby2.5", "ruby2.7", "provided", "provided.al2", "nodejs18.x"], var.stop_lambda_function_runtime)
    error_message = "Argument 'runtime' must be one of nodejs | nodejs4.3 | nodejs6.10 | nodejs8.10 | nodejs10.x | nodejs12.x | nodejs14.x | nodejs16.x | java8 | java8.al2 | java11 | python2.7 | python3.6 | python3.7 | python3.8 | python3.9 | python3.10 | dotnetcore1.0 | dotnetcore2.0 | dotnetcore2.1 | dotnetcore3.1 | dotnet6 | nodejs4.3-edge | go1.x | ruby2.5 | ruby2.7 | provided | provided.al2 | nodejs18.x."
  }
}

variable "stop_lambda_function_handler" {
  description = "The name of the handler function in the Lambda code."
  type        = string
}

variable "stop_lambda_function_source_code_filename" {
  description = "The path to the deployment package of the Lambda function. Exactly one of filename or s3_bucket must be specified."
  type        = string
}

variable "stop_lambda_function_package_type" {
  description = "Lambda deployment package type. Valid value is 'Zip'"
  type        = string
  default     = "Zip"
  validation {
    condition     = contains(["Zip"], var.stop_lambda_function_package_type)
    error_message = "Argument 'architectures' must be 'Zip'. "
  }
}

variable "stop_lambda_function_memory_size" {
  description = "Amount of memory in MB allocated to the Lambda function during runtime"
  type        = number
  default     = 128
}

variable "stop_lambda_function_timeout" {
  description = "The function execution time in seconds before AWS Lambda terminates the function"
  type        = number
  default     = 900
}

variable "stop_lambda_function_environment_variables" {
  description = "Map of string of environment variables to set for the Lambda function."
  type        = string
}


variable "stop_lambda_function_tags" {
  description = "Tags to apply to the Lambda function"
  type        = map(string)
}

#############_START_LAMBDA_FUNCTION_#########################################
variable "start_lambda_function_name" {
  type        = string
  description = "Name of the Lambda function whose resource policy you are updating"
}

variable "start_lambda_function_role" {
  description = "Amazon Resource Name (ARN) of the function's execution role. Provides the function's identity and access to AWS services and resources."
  type        = string
}

variable "start_lambda_function_architectures" {
  description = "Instruction set architecture for your Lambda function. Only one of arm64 or x86_64 can be mentioned in the list"
  type        = list(string)
  default     = ["x86_64"]
}

variable "start_lambda_function_description" {
  description = "Description of the Lambda function "
  type        = string
}

variable "start_lambda_function_runtime" {
  description = "The runtime environment for the Lambda function. If deployment package is of .zip type , then runtime has to be specified mandatorily"
  type        = string
  validation {
    condition     = contains(["nodejs", "nodejs4.3", "nodejs6.10", "nodejs8.10", "nodejs10.x", "nodejs12.x", "nodejs14.x", "nodejs16.x", "java8", "java8.al2", "java11", "python2.7", "python3.6", "python3.7", "python3.8", "python3.9", "python3.10", "dotnetcore1.0", "dotnetcore2.0", "dotnetcore2.1", "dotnetcore3.1", "dotnet6", "nodejs4.3-edge", "go1.x", "ruby2.5", "ruby2.7", "provided", "provided.al2", "nodejs18.x"], var.start_lambda_function_runtime)
    error_message = "Argument 'runtime' must be one of nodejs | nodejs4.3 | nodejs6.10 | nodejs8.10 | nodejs10.x | nodejs12.x | nodejs14.x | nodejs16.x | java8 | java8.al2 | java11 | python2.7 | python3.6 | python3.7 | python3.8 | python3.9 | python3.10 | dotnetcore1.0 | dotnetcore2.0 | dotnetcore2.1 | dotnetcore3.1 | dotnet6 | nodejs4.3-edge | go1.x | ruby2.5 | ruby2.7 | provided | provided.al2 | nodejs18.x."
  }
}

variable "start_lambda_function_handler" {
  description = "The name of the handler function in the Lambda code."
  type        = string
}

variable "start_lambda_function_source_code_filename" {
  description = "The path to the deployment package of the Lambda function. Exactly one of filename or s3_bucket must be specified."
  type        = string
}

variable "start_lambda_function_package_type" {
  description = "Lambda deployment package type. Valid value is 'Zip'"
  type        = string
  default     = "Zip"
  validation {
    condition     = contains(["Zip"], var.start_lambda_function_package_type)
    error_message = "Argument 'architectures' must be 'Zip'. "
  }
}

variable "start_lambda_function_memory_size" {
  description = "Amount of memory in MB allocated to the Lambda function during runtime"
  type        = number
  default     = 128
}

variable "start_lambda_function_timeout" {
  description = "The function execution time in seconds before AWS Lambda terminates the function"
  type        = number
  default     = 900
}

variable "start_lambda_function_environment_variables" {
  description = "Map of string of environment variables to set for the Lambda function."
  type        = string
}

variable "start_lambda_function_tags" {
  description = "Tags to apply to the Lambda function"
  type        = map(string)
}