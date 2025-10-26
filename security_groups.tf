resource "aws_security_group" "public_sg" {
  name        = "public facing sg"
  vpc_id      = aws_vpc.my_vpc.id
  description = "security group to allow traffic from internet into a machine on our vpc"
  tags = {
    Name = "public_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_public" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_security_group" "private_sg" {
  name        = "private facing sg"
  vpc_id      = aws_vpc.my_vpc.id
  description = "security group to allow traffic from private subnet into a machine on our vpc"
  tags = {
    Name = "private_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_private" {
  security_group_id = aws_security_group.private_sg.id
  cidr_ipv4         = "10.0.1.0/24" # only allow ssh from public subnet
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}