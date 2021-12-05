resource "aws_iam_role_policy_attachment" "runs_from_service_AWSLambdaBasicExecutionRole" {
  provider   = aws.management
  role       = aws_iam_role.runs_from_service.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  depends_on = [
    aws_iam_role.runs_from_service,
  ]
}
