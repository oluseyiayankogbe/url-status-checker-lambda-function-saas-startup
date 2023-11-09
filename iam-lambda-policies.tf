resource "aws_iam_policy" "lambda_policy" {
  name        = "StatusBotLambdaPolicy"
  description = "Policy for StatusBot Lambda function"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "logs:CreateLogGroup",
        Resource = "arn:aws:logs:us-west-1:*:*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:us-west-1:*:*:log-group:/aws/lambda/StatusBotLambda:*"
      }
      # Add more permissions as needed
    ]
  })
}

resource "aws_iam_policy" "lambda_sqs_policy" {
  name        = "LambdaSQSPolicy"
  description = "Policy to allow Lambda to interact with SQS"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "sqs:SendMessage"
        ],
        Resource = aws_sqs_queue.lambda_queue.arn
      }
    ]
  })
}



resource "aws_iam_policy" "lambda_sns_policy" {
  name        = "LambdaSNSPolicy"
  description = "Policy to allow Lambda to interact with SNS"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "sns:Publish"
        ],
        Resource = aws_sns_topic.lambda_topic.arn
      }
    ]
  })
}

