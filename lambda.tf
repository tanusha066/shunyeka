resource "aws_iam_role" "shunyeka_lambda" {
  name = "shunyeka_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "shunyeka_lambda" {
  
  filename      = "shunyeka_lambda.zip"
  function_name = "shunyeka_lambda"
  role          = aws_iam_role.shunyeka_lambda.arn
  handler       = "index.js"

  
    source_code_hash = filebase64sha256("shunyeka_lambda.zip")

  runtime = "nodejs12.x"

 
}