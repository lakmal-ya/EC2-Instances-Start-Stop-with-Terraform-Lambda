#############_LAMBDA_FUNCTION_###############################################
variable "lambda_function_name" {
  type        = string
  description = " Name of the Lambda function whose resource policy you are updating"
}

variable "lambda_function_role" {
  description = "Amazon Resource Name (ARN) of the function's execution role. Provides the function's identity and access to AWS services and resources."
  type        = string
}

variable "architectures" {
  description = "Instruction set architecture for your Lambda function. Only one of arm64 or x86_64 can be mentioned in the list"
  type        = list(string)
  default     = ["x86_64"]
}

variable "description" {
  description = "Description of the Lambda function "
  type        = string
}

variable "runtime" {
  description = "The runtime environment for the Lambda function. If deployment package is of .zip type , then runtime has to be specified mandatorily"
  type        = string
  validation {
    condition     = contains(["nodejs", "nodejs4.3", "nodejs6.10", "nodejs8.10", "nodejs10.x", "nodejs12.x", "nodejs14.x", "nodejs16.x", "java8", "java8.al2", "java11", "python2.7", "python3.6", "python3.7", "python3.8", "python3.9", "dotnetcore1.0", "dotnetcore2.0", "dotnetcore2.1", "dotnetcore3.1", "dotnet6", "nodejs4.3-edge", "go1.x", "ruby2.5", "ruby2.7", "provided", "provided.al2", "nodejs18.x"], var.runtime)
    error_message = "Argument 'runtime' must be one of nodejs | nodejs4.3 | nodejs6.10 | nodejs8.10 | nodejs10.x | nodejs12.x | nodejs14.x | nodejs16.x | java8 | java8.al2 | java11 | python2.7 | python3.6 | python3.7 | python3.8 | python3.9 | dotnetcore1.0 | dotnetcore2.0 | dotnetcore2.1 | dotnetcore3.1 | dotnet6 | nodejs4.3-edge | go1.x | ruby2.5 | ruby2.7 | provided | provided.al2 | nodejs18.x."
  }
}

variable "handler" {
  description = "The name of the handler function in the Lambda code."
  type        = string
  default     = null
}

variable "source_code_filename" {
  description = "The path to the deployment package of the Lambda function. Exactly one of filename or s3_bucket must be specified."
  type        = string
  default     = null
}

variable "memory_size" {
  description = "Amount of memory in MB allocated to the Lambda function during runtime"
  type        = number
  default     = 128
}

variable "package_type" {
  description = "Lambda deployment package type. Valid value is 'Zip'"
  type        = string
  default     = "Zip"
  validation {
    condition     = contains(["Zip"], var.package_type)
    error_message = "Argument 'architectures' must be 'Zip'. "
  }
}

variable "timeout" {
  description = "The function execution time in seconds before AWS Lambda terminates the function"
  type        = number
  default     = null
}

variable "environment_variables" {
  description = "Map of string of environment variables to set for the Lambda function."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the Lambda function"
  type        = map(string)
}