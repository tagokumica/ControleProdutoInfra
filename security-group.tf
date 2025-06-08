resource "aws_security_group" "allow_sg" {
  name        = "allow_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_database"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ipv4_sg" {
  security_group_id = aws_security_group.allow_sg.id
  cidr_ipv4         = aws_subnet.public.cidr_block
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}

resource "aws_security_group" "ecs_service" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
}