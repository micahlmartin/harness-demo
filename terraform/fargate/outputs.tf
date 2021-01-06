output "fargate_cluster_arn" {
  value = aws_ecs_cluster.name.id
}

output "fargate_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "fargate_execution_role" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "security_group_ids" {
  value = data.aws_security_group.selected.id
}

output "subnets" {
  value = data.aws_subnet.selected.id
}
