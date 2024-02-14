# ECS Task Execution Role to access Cloudwatch & ECR
resource "aws_iam_role" "aws_ecs_task_execution_role" {
  name = var.aws_ecs_task_execution_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attaching ECS Task Execution policy to the Role to access Cloudwatch & ECR
resource "aws_iam_role_policy_attachment" "aws_ecs_task_execution_role_policy_attachment" {
  for_each = toset(var.aws_batch_ecs_task_execution_policy_list)
  role       = aws_iam_role.aws_ecs_task_execution_role.name
  policy_arn = each.value
  depends_on = [aws_iam_role.aws_ecs_task_execution_role]
}


resource "aws_iam_role" "scheduler-batch-role" {
  name = var.scheduler_role_name
  managed_policy_arns = [var.scheduler_batch_policy]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "scheduler.amazonaws.com"
        }
      },
    ]
  })
}