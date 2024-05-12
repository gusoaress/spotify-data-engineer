provider "aws" {
  region = "sa-east-1"
}

resource "aws_iam_role" "glue_role" {
  assume_role_policy = file("infra/iam/glue_trust.json")
  policy = file("infra/iam/glue_policy")
  name = "glue_role"
}

output "glue_role_arn" {
  value = aws_iam_role.glue_role.arn
}

# Adicione outras configurações conforme necessário
