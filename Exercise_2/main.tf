provider "aws" {
	region = var.aws_region
}


resource "aws_iam_role" "uda_lambda_role" {
	name = "uda_lambda_role"

	assume_role_policy = <<EOF
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
            "Resource": "*"
        }
    	]
	}
EOF
}

data "archive_file" "init" {
  type        = "zip"
  source_file = "${path.module}/greet_lambda.py"
  output_path = "${path.module}/files/greet_lambda.zip"
}


resource "aws_lambda_function" "udacity_lambda" {
  	filename      = data.archive_file.init.output_path
  	function_name = "greet_lambda"
  	role          = aws_iam_role.uda_lambda_role.arn
 	handler       = "greet_lambda.lambda_handler"

  	runtime = "python3.8"

  	environment {
    	variables = {
      	greeting = "hello...."
		}
	}
}