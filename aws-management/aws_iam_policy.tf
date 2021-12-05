
resource "aws_iam_policy" "terraform" {
  provider    = aws.management
  name        = "terraform"
  description = "各 AWS アカウントの terraform ロールへアクセスを許可する。"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sts:AssumeRole"
        ]
        Resource = [
          "arn:aws:iam::${aws_organizations_account.management.id}:role/terraform",
          "arn:aws:iam::${aws_organizations_account.audit.id}:role/terraform",
          "arn:aws:iam::${aws_organizations_account.sandbox.id}:role/terraform",
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_execute_default" {
  provider    = aws.management
  name        = "lambda_execute_default"
  description = "Lambda の実行権限（初期設定）"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "logs:CreateLogGroup"
        Resource = "arn:aws:logs:${var.region}:${aws_organizations_account.management.id}:*"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:${var.region}:${aws_organizations_account.management.id}:log-group:/aws/lambda/*"
      }
    ]
  })
}

resource "aws_iam_policy" "ce_access" {
  provider    = aws.management
  name        = "ce_access"
  description = "CostExplorerへのアクセス"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ce:GetCostAndUsage"]
        Resource = "*"
      }
    ]
  })
}
