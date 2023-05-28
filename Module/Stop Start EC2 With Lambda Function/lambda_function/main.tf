#-------------- Lambda function--------------------------------------------------------#

resource "aws_lambda_function" "lambda_function" {
  function_name                      = var.lambda_function_name
  role                               = var.lambda_function_role
  architectures                      = var.architectures
  description                        = var.description
  handler                            = var.handler
  runtime                            = var.runtime
  filename                           = var.source_code_filename
  memory_size                        = var.memory_size
  package_type                       = var.package_type
  source_code_hash                   = var.source_code_filename == null ? null : filebase64sha256(var.source_code_filename)
  timeout                            = var.timeout
  tags                               = var.tags

  dynamic "environment" {
    for_each = var.environment_variables != null ? [1] : []
    content {
      variables = local.environment_variables
    }
  }
}