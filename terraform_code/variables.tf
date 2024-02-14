variable AWS_DEFAULT_REGION {
  type        = string
  description = "AWS Region Name"
}


variable aws_ecs_task_execution_role_name {
  default="tast_to_Execute_job"
  type        = string
  description = "Task Execution Role"
}

variable scheduler_batch_policy {
  type        = string
  description = "AWS EventBridge Scheduler Role"
}


variable scheduler_role_name {
  default="scheduler-batch-role"
  type        = string
  description = "AWS EventBridge Scheduler Role"
}

variable batch_compute_env_name {
  type        = list(string)
  description = "AWS Batch Compute Env"
}



variable aws_batch_ecs_task_execution_policy_list {
  type = list
  description = "AWS Batch ECS Task Execution Policy List"
}



variable aws_batch_job_queue_name {
  type        = string
  description = "AWS Batch Queue"
}




variable aws_batch_job_queue_priority {
  type        = string
  description = "AWS Batch Queue Priority"
}


variable aws_batch_job_name {
  type        = string
  description = "AWS Batch Job Name"
}


variable aws_batch_JD_vcpu {
  type        = string
  description = "VCPU for AWS Batch Job Description"
}



variable aws_batch_JD_memory {
  type        = string
  description = "Memory for AWS Batch Job Description"
}

variable aws_ecr_repo_name {
  type        = string
  description = "AWS ECR Repo Name"
}




variable batch_job_schedule_expression {
  type        = string
  description = "AWS Batch Schedule Expression"
}


variable eventbridge_rule_name {
  type        = string
  description = "AWS Batch Eventbridge Rule Name"
}


variable product_environment_tag {
  type        = string
  description = "AWS Env"
}