resource "aws_ecs_service" "fargate_service" {
  name            = "fargate-service"
  cluster         = aws_ecs_cluster.fargate_cluster.id
  task_definition = aws_ecs_task_definition.fargate_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.public.id]
    assign_public_ip = true
    security_groups  = [aws_security_group.ecs_service.id]
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_role_policy]
}