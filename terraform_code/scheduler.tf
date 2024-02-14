resource "aws_scheduler_schedule" "cron" {
  name        = var.eventbridge_rule_name
  group_name  = "default"
  depends_on = [aws_iam_role.scheduler-batch-role,aws_batch_job_definition.batch_job,
               aws_batch_job_queue.batch_queue]
  flexible_time_window {
    mode = "OFF"
  }

  #schedule_expression = "cron(*/30 * * * ? *)" # run every 30 minutes
  schedule_expression = var.batch_job_schedule_expression
  schedule_expression_timezone = "Asia/Calcutta" # Default is UTC
  description = "submitJob Batch event"

  target {
    arn = "arn:aws:scheduler:::aws-sdk:batch:submitJob"
    role_arn = aws_iam_role.scheduler-batch-role.arn
    
    input = jsonencode({
        "JobName": "${aws_batch_job_definition.batch_job.name}",
        "JobDefinition": "${aws_batch_job_definition.batch_job.name}",
        "JobQueue": "${aws_batch_job_queue.batch_queue.arn}"
    })
  }
}
