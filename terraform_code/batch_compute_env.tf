

resource "aws_batch_job_queue" "batch_queue" {
  name     = var.aws_batch_job_queue_name
  state    = "ENABLED"
  priority = var.aws_batch_job_queue_priority
  compute_environments = var.batch_compute_env_name
  tags = {
    Cost_Center_Name     = "MCC_Ops_Tech_Licenses"
    Department           = "PET"
    "epi:team"           = "PET"
    "epi:supported-by"   = "PET"
    "epi:product_stream" = "submit"
    "epi:owner"          = "Jay.Kumar@episource.com"
    "Owner_2"            = "satadrumukherjee.madhusudan@episource.com"
    "epi:environment"    = var.product_environment_tag
    Name                 = "Mac Portal Job Queue for ${var.product_environment_tag}"
  }
}

resource "aws_batch_job_definition" "batch_job" {
  depends_on = [aws_iam_role.aws_ecs_task_execution_role]
  name = var.aws_batch_job_name
  type = "container"

  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = jsonencode({
    command    = ["echo","hello world"]
    image      = "public.ecr.aws/amazonlinux/amazonlinux:latest"
    jobRoleArn = aws_iam_role.aws_ecs_task_execution_role.arn

    fargatePlatformConfiguration = {
      platformVersion = "LATEST"
    }

    networkConfiguration = {
      assignPublicIp = "ENABLED"
    }

    resourceRequirements = [
      {
        type  = "VCPU"
        value = var.aws_batch_JD_vcpu
      },
      {
        type  = "MEMORY"
        value = var.aws_batch_JD_memory
      }
    ]

    executionRoleArn = aws_iam_role.aws_ecs_task_execution_role.arn
  }
  )
  tags = {
    Cost_Center_Name     = "MCC_Ops_Tech_Licenses"
    Department           = "PET"
    "epi:team"           = "PET"
    "epi:supported-by"   = "PET"
    "epi:product_stream" = "submit"
    "epi:owner"          = "Jay.Kumar@episource.com"
    "Owner_2"            = "satadrumukherjee.madhusudan@episource.com"
    "epi:environment"    = var.product_environment_tag
    Name                 = "Mac Portal Job Definition for ${var.product_environment_tag}"
  }
}
