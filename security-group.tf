resource "aws_security_group" "allow_database" {
  name        = "allow_database"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_database"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ipv4_database" {
  security_group_id = aws_security_group.allow_database.id
  cidr_ipv4         = aws_subnet.public.cidr_block
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}