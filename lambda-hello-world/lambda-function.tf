resource "aws_iam_role" "lambda-role" {
  name               = "lambda-role"
  assume_role_policy = file("resources/LambdaTrustRelationship.json")
}

resource "aws_iam_policy" "lambda-role" {
  name   = "lambda-role-Policy"
  policy = file("resources/lambdaRolePolicy.json")
}

resource "aws_iam_role_policy_attachment" "lambda-role" {
  role       = aws_iam_role.lambda-role.name
  policy_arn = aws_iam_policy.lambda-role.arn
}

data "archive_file" "helloworldzip" {
  type        = "zip"
  source_file = "helloWorld.py"
  output_path = "helloWorld.zip"
}

resource "aws_lambda_function" "helloWorld" {
  function_name    = "hellowWorld"
  description      = "write a topic to kafka machine when an object is pushed to s3 bucket"
  handler          = "helloWorld.lambda_handler"
  runtime          = "python3.7"
  role             = aws_iam_role.lambda-role.arn
  filename         = "helloWorld.zip"
  source_code_hash = filebase64sha256("helloWorld.zip")
}

resource "aws_cloudwatch_log_group" "helloWorld" {
  name              = "/aws/lambda/${aws_lambda_function.helloWorld.function_name}"
  retention_in_days = "14"
}
