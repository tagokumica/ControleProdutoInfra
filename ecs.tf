resource "aws_ecs_service" "controle_produto_fargate_service" {
  name            = "controle-produto-fargate-service"
  cluster         = aws_ecs_cluster.controle_produto_fargate_cluster.id
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.public.id]
    assign_public_ip = true
    security_groups  = [aws_security_group.allow_sg.id]
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_role_policy]
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_cluster" "controle_produto_fargate_cluster" {
  name = "controle_produto_fargate_cluster"
}