resource "aws_ecs_cluster" "test" {
  name = "micah-fargate-test" 
}

output "fargate_cluster_arn" {
  value = aws_ecs_cluster.test.id
}
