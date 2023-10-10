#  AWS Lambda function
resource "aws_lambda_function" "count_function" {
  filename      = data.archive_file.zip_python_code.output_path # Path to your Lambda deployment package
  source_code_hash = data.archive_file.zip_python_code.output_base64sha256
  function_name = "count_function"
  handler       = "func.lambda_handler"
  runtime       = "python3.11"

  # IAM Role for Lambda execution
  role = aws_iam_role.lambda_role.arn

}


# Define the IAM role for Lambda execution
resource "aws_iam_role" "lambda_role" {
  name = "my-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "iam_policy_for_count_function" {

  name        = "aws_iam_policy_for_terraform_count_function_policy"
  path        = "/"
  description = "AWS IAM Policy for managing the count function role"
    policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Resource" : "arn:aws:logs:*:*:*",
          "Effect" : "Allow"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "dynamodb:UpdateItem",
			      "dynamodb:GetItem",
            "dynamodb:PutItem"
          ],
          "Resource" : "arn:aws:dynamodb:*:*:table/Counter"
        },
      ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_count_function.arn
}

data "archive_file" "zip_python_code" {
  type = "zip"
  source_dir = "${path.module}/lambda"
  output_path = "${path.module}/lambda/func.zip"
}

