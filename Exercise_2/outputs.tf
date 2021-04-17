# TODO: Define the output variable for the lambda function.
output "lambda_last_modified" {
  value = aws_lambda_function.udacity_lambda.last_modified
}