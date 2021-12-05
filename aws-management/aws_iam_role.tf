resource "aws_iam_role" "runs_from_service" {
  provider              = aws.management
  name                  = "runs_from_service"
  description           = "Runs from AWS Services."
  force_detach_policies = true
  max_session_duration  = 43200
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "cloudwatch.amazonaws.com",
            "events.amazonaws.com",
            "lambda.amazonaws.com",
          ]
        }
        Action    = "sts:AssumeRole"
        Condition = {}
      }
    ]
  })
}

resource "aws_iam_role" "github_actions" {
  provider = aws.management
  name     = "github-actions"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRoleWithWebIdentity"
      Principal = {
        Federated = aws_iam_openid_connect_provider.github_actions.arn
      }
      Condition = {
        StringLike = {
          "token.actions.githubusercontent.com:sub" = [
            "repo:${var.GITHUB_REPOSITORY_NAME}:*"
          ]
        }
      }
    }]
  })
}