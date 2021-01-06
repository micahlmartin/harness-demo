output "fargate_cluster_arn" {
  value = aws_ecs_cluster.test.id
}

output "fargate_execution_role" {
  value = aws_iam_role.ecs_task_execution_role.arn
}
