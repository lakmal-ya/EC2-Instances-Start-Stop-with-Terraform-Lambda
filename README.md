# EC2-Instances-Start-Stop-with-Terraform-Lambda
Automating EC2 Instances Start/Stop with Terraform and Lambda

<!-- BEGIN_TF_DOCS -->
## EC2 Stop Start Lambda function Terraform Module
EC2 Start Stop function using CloudWatch Events is a method to automate the start and stop actions of Amazon EC2 instances based on scheduled events or triggers using CloudWatch Events and AWS Lambda. This approach allows you to define specific schedules or conditions under which the EC2 instances should be started or stopped, providing cost optimization and operational efficiency.

Here's a brief overview of the components involved:

EC2 Instances: These are the virtual servers running on the Amazon Elastic Compute Cloud (EC2) service. You can have multiple EC2 instances that you want to automate the start and stop actions for.

CloudWatch Events: CloudWatch Events is a service provided by AWS that allows you to schedule and trigger automated actions based on events within your AWS environment. It provides a reliable and scalable event delivery system.

AWS Lambda: AWS Lambda is a serverless computing service that allows you to run code without provisioning or managing servers. Lambda functions are used to execute the start and stop operations on the EC2 instances based on specific triggers or schedules defined by CloudWatch Events.

## Prerequistes
To set up the EC2 start stop function using CloudWatch Events, you will need to configure the necessary IAM roles with the required permissions. Here are the pre-requisites for IAM roles:

1. Lambda Execution Role: You need to create an IAM role that can be assumed by the AWS Lambda service. This role should have the necessary permissions to execute the Lambda function and interact with EC2 instances. At a minimum, the role should have the AWSLambdaBasicExecutionRole policy attached to it. Additionally, you can attach policies such as AmazonEC2FullAccess or a custom policy with the required EC2 permissions.

Ensure that you have appropriate permissions to create IAM roles and policies. Typically, you would need administrative privileges or permissions to manage IAM resources.

Here's a summary of the necessary permissions for the IAM roles:

For Lambda Execution Role:

- AWSLambdaBasicExecutionRole
- EC2 permissions (e.g., See below simple policy)

By setting up the IAM roles with the required permissions, you can ensure that the Lambda function and CloudWatch Events have the necessary access to execute the EC2 start stop function.

Simple roles for lambda function:

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeInstances",
        "ec2:Start*",
        "ec2:Stop*"
      ],
      "Resource": "*"
    }
  ]
}

```

## Note:
- By default, the current configuration will only filter out 20 instances in a single API request. If you need to increase this limit, you can modify the Python script by updating the value of "MaxResults". By adjusting this value, you can retrieve a larger number of instances in each API request.

- CloudWatch event schedule expressions only support UTC time. Please check your time zone against UTC time before setting up the time.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>4.66.1 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_lambda_permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## CloudWatch Event Rule Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_event_bus_name"></a> [event\_bus\_name](#input\_event\_bus\_name) | The name or ARN of the event bus to associate with this rule. If you omit this, the default event bus is used. | `string` | `"default"` | no |
| <a name="input_event_description"></a> [event\_description](#input\_event\_description) | The description of the rule. | `string` | n/a | yes |
| <a name="input_event_name"></a> [event\_name](#input\_event\_name) | The name of the rule. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| <a name="input_event_pattern"></a> [event\_pattern](#input\_event\_pattern) | The event pattern described a JSON object. At least one of schedule\_expression or event\_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details. | `string` | `"schedule_expression"` | no |
| <a name="input_event_rule_tags"></a> [event\_rule\_tags](#input\_event\_rule\_tags) | Tags of event rule | `map(string)` | n/a | yes |
| <a name="input_event_target_arn"></a> [event\_target\_arn](#input\_event\_target\_arn) | The Amazon Resource Name (ARN) associated with the role that is used for target invocation. | `string` | n/a | yes |
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | Whether the rule should be enabled (defaults to true). | `string` | `true` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | Name of the Lambda function whose resource policy you are updating | `string` | n/a | yes |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule\_expression or event\_pattern is required. Can only be used on the default event bus. For more information, refer to the AWS documentation Schedule Expressions for Rules. | `string` | n/a | yes |

## Lambda Function Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_architectures"></a> [architectures](#input\_architectures) | Instruction set architecture for your Lambda function. Only one of arm64 or x86\_64 can be mentioned in the list | `list(string)` | <pre>[<br>  "x86_64"<br>]</pre> | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the Lambda function | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Map of string of environment variables to set for the Lambda function. | `string` | `null` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | The name of the handler function in the Lambda code. | `string` | `null` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | Name of the Lambda function whose resource policy you are updating | `string` | n/a | yes |
| <a name="input_lambda_function_role"></a> [lambda\_function\_role](#input\_lambda\_function\_role) | Amazon Resource Name (ARN) of the function's execution role. Provides the function's identity and access to AWS services and resources. | `string` | n/a | yes |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Amount of memory in MB allocated to the Lambda function during runtime | `number` | `128` | no |
| <a name="input_package_type"></a> [package\_type](#input\_package\_type) | Lambda deployment package type. Valid value is 'Zip' | `string` | `"Zip"` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The runtime environment for the Lambda function. If deployment package is of .zip type , then runtime has to be specified mandatorily | `string` | n/a | yes |
| <a name="input_source_code_filename"></a> [source\_code\_filename](#input\_source\_code\_filename) | The path to the deployment package of the Lambda function. Exactly one of filename or s3\_bucket must be specified. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the Lambda function | `map(string)` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | The function execution time in seconds before AWS Lambda terminates the function | `number` | `null` | no |

## Cloudwatch Event Rule Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_cloudwatch_event_rule_arn"></a> [aws\_cloudwatch\_event\_rule\_arn](#output\_aws\_cloudwatch\_event\_rule\_arn) | aws cloudwatch event rule ARN |

## Lambda Function Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | ARN of the Lambda Function |

## Modules

```
#------------------------------Stop Lambda Function & Cloudwatch Rule--------------------------------------------------------------#
# Stop EC2 Instance Cloudwatch Event Rule 
stop_cloudwatch_event_name                = "TF_CLOUDWATCH_START_EVENT_TEST"
stop_cloudwatch_event_schedule_expression = "cron(32 10 * * ? *)"  # Time will be the only support for UTC. Please check your time zone against UTC time before you set up the time.
stop_cloudwatch_event_bus_name            = "default"
stop_cloudwatch_event_pattern             = "schedule_expression"
stop_cloudwatch_event_description         = "TF_EVENT_description"
stop_cloudwatch_event_is_enabled          = true
stop_cloudwatch_event_rule_tags = {
  name     = "lambda_Module"
  owner    = "dulanjanalakmal@gmail.com"
}

# Stop EC2 Instance Lambda Function Details 
aws_region                                = "ap-southeast-2"
aws_profile                               = "default"
stop_lambda_function_name                 = "stop_lambda_funcation"
stop_lambda_function_role                 = "arn:aws:iam::111111111111:role/service-role/lambda_stop_start-role-9dlpliuy"
stop_lambda_function_architectures        = ["arm64"]
stop_lambda_function_description          = "AWS Lambda function created by using terraform"
stop_lambda_function_source_code_filename = "stop_lambda_function.zip"
stop_lambda_function_package_type         = "Zip" # Handler and Runtime must be mentioned when Package type is Zip 
stop_lambda_function_runtime              = "python3.8"
stop_lambda_function_handler              = "stop_lambda_function.lambda_handler"
stop_lambda_function_timeout              = 900
stop_lambda_function_memory_size          = 256
stop_lambda_function_environment_variables = "{\"project\" : \"test\", \"envrionment\" : \"dev\"}"
stop_lambda_function_tags = {
  name     = "lambda_Function"
  owner    = "dulanjanalakmal@gmail.com"
}

#------------------------------Start Lambda Function & Cloudwatch Rule--------------------------------------------------------------#
# Start EC2 Instance Cloudwatch Event Rule 
start_cloudwatch_event_name                = "TF_CLOUDWATCH_STOP_EVENT_TEST"
start_cloudwatch_event_schedule_expression = "cron(40 10 * * ? *)" # Time will be the only support for UTC. Please check your time zone against UTC time before you set up the time.
start_cloudwatch_event_bus_name            = "default"
start_cloudwatch_event_pattern             = "schedule_expression"
start_cloudwatch_event_description         = "TF_EVENT_description"
start_cloudwatch_event_is_enabled          = true
start_cloudwatch_event_rule_tags = {
  name     = "lambda_Module"
  owner    = "dulanjanalakmal@gmail.com"
}

# Start EC2 Instance Lambda Function Details 
start_lambda_function_name                 = "start_lambda_funcation"
start_lambda_function_role                 = "arn:aws:iam::111111111111:role/service-role/lambda_stop_start-role-9dlpliuy"
start_lambda_function_architectures        = ["arm64"]
start_lambda_function_description          = "AWS Lambda function created by using terraform"
start_lambda_function_source_code_filename = "start_lambda_function.zip"
start_lambda_function_package_type         = "Zip" # Handler and Runtime must be mentioned when Package type is Zip 
start_lambda_function_runtime              = "python3.8"
start_lambda_function_handler              = "start_lambda_function.lambda_handler"
start_lambda_function_timeout              = 900
start_lambda_function_memory_size          = 256
start_lambda_function_environment_variables = "{\"project\" : \"test\", \"envrionment\" : \"dev\"}"
start_lambda_function_tags = {
  name     = "lambda_Function"
  owner    = "dulanjanalakmal@gmail.com"
}
```

<!-- END_TF_DOCS -->