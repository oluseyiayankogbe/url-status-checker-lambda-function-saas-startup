
data "archive_file" "python_lambda_package" {  
  type = "zip"  
  source_file = "url-status-checker.py" 
  output_path = "url-status-checker.zip"
}

resource "aws_lambda_function" "statusbot_lambda" {
  filename      = "url-status-checker.zip"  # Path to your zipped Lambda function code
  function_name = "UrlCheckerLambda"
  source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  timeout       = 10
}







