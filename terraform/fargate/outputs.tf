output "fargate_cluster_arn" {
  value = aws_ecs_cluster.main.id
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
  value = aws_security_group.http.id
}

output "subnet_ids" {
  value = data.aws_subnet.selected.*.id
}

output "region" {
  value = var.region
}

output "lb_id" {
  value = aws_lb.main.id
}

output "primary_target_group" {
  value = aws_lb_target_group.primary.id
}

output "stage_target_group" {
  value = aws_lb_target_group.stage.id
}

output "primary_listener" {
  value = aws_lb_listener.primary.id
}

output "stage_listener" {
  value = aws_lb_listener.stage.id
}
