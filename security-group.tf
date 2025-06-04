resource "aws_security_group" "allow_database" {
  name        = "allow_database"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_database"
  }
}

resource "aws_security_group" "controle_produto_fargate_service" {
  name        = "ecs-service-sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ipv4_database" {
  security_group_id = aws_security_group.allow_database.id
  cidr_ipv4         = aws_subnet.public.cidr_block
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}