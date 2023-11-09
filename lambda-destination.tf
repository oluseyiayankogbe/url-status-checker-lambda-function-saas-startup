resource "aws_lambda_function_event_invoke_config" "urlchecker_destination" {
  function_name = aws_lambda_function.urlchecker_lambda.function_name

  destination_config {
    on_failure {
      destination = aws_sqs_queue.lambda_queue.arn
    }

    on_success {
      destination = aws_sns_topic.lambda_topic.arn
    }
  }
}

resource "aws_sqs_queue" "lambda_queue" {
  name = "MyDestinationQueue"
  # additional queue configurations
}


resource "aws_sns_topic" "lambda_topic" {
  name = "lambda-success"
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.lambda_topic.arn
  protocol  = "email"
  endpoint  = "oluseyiayankogbe@gmail.com"
}