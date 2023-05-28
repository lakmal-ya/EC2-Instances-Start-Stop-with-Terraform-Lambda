# Stop EC2 Instances CloudWatch Event Rule
module "aws_stop_cloudwatch_event_rule" {
  source = "../../../Modules/Compute/Stop Start EC2 With Lambda Function/cloudwatch_rule"

  event_name           = var.stop_cloudwatch_event_name
  schedule_expression  = var.stop_cloudwatch_event_schedule_expression
  event_bus_name       = var.stop_cloudwatch_event_bus_name
  event_pattern        = var.stop_cloudwatch_event_pattern
  event_description    = var.stop_cloudwatch_event_description
  role_arn             = var.stop_cloudwatch_event_role_arn
  is_enabled           = var.stop_cloudwatch_event_is_enabled
  event_rule_tags      = var.stop_cloudwatch_event_rule_tags
  lambda_function_name = var.stop_lambda_function_name
  event_target_arn     = module.aws_stop_lambda_function.lambda_function_arn
  depends_on           = [module.aws_stop_lambda_function]
}

# Stop EC2 Instances Lambda function
module "aws_stop_lambda_function" {
  source = "../../../Modules/Compute/Stop Start EC2 With Lambda Function/lambda_function"

  lambda_function_name  = var.stop_lambda_function_name
  lambda_function_role  = var.stop_lambda_function_role
  architectures         = var.stop_lambda_function_architectures
  description           = var.stop_lambda_function_description
  source_code_filename  = var.stop_lambda_function_source_code_filename
  package_type          = var.stop_lambda_function_package_type
  runtime               = var.stop_lambda_function_runtime
  handler               = var.stop_lambda_function_handler
  timeout               = var.stop_lambda_function_timeout
  memory_size           = var.stop_lambda_function_memory_size
  environment_variables = var.stop_lambda_function_environment_variables
  tags                  = var.stop_lambda_function_tags

}

# Start EC2 Instances CloudWatch Event Rule
module "aws_start_cloudwatch_event_rule" {
  source = "../../../Modules/Compute/Stop Start EC2 With Lambda Function/cloudwatch_rule"

  event_name           = var.start_cloudwatch_event_name
  schedule_expression  = var.start_cloudwatch_event_schedule_expression
  event_bus_name       = var.start_cloudwatch_event_bus_name
  event_pattern        = var.start_cloudwatch_event_pattern
  event_description    = var.start_cloudwatch_event_description
  role_arn             = var.start_cloudwatch_event_role_arn
  is_enabled           = var.start_cloudwatch_event_is_enabled
  event_rule_tags      = var.start_cloudwatch_event_rule_tags
  lambda_function_name = var.start_lambda_function_name
  event_target_arn     = module.aws_start_lambda_function.lambda_function_arn
  depends_on           = [module.aws_start_lambda_function]
}

# Start EC2 Instances Lambda function
module "aws_start_lambda_function" {
  source = "../../../Modules/Compute/Stop Start EC2 With Lambda Function/lambda_function"

  lambda_function_name  = var.start_lambda_function_name
  lambda_function_role  = var.start_lambda_function_role
  architectures         = var.start_lambda_function_architectures
  description           = var.start_lambda_function_description
  source_code_filename  = var.start_lambda_function_source_code_filename
  package_type          = var.start_lambda_function_package_type
  runtime               = var.start_lambda_function_runtime
  handler               = var.start_lambda_function_handler
  timeout               = var.start_lambda_function_timeout
  memory_size           = var.start_lambda_function_memory_size
  environment_variables = var.start_lambda_function_environment_variables
  tags                  = var.start_lambda_function_tags
}