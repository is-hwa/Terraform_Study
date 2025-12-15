#################################
# 1. ALB
# * SG 생성
# * TG 생성
# * ALB 생성
# * ALB Listener 생성
# 2. ASG
# * SG 생성
# * launch Tmeplate 생성 
# * ASG 생성
#################################

#########################
# 0. infra
#########################
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc

data "aws_vpc" "selected" {
  default = true
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

#########################
# 1. ALB
#########################
# * SG 생성
# * TG 생성
# * ALB 생성
# * ALB Listener 생성

#########################
# * SG 생성
#########################
# ingress: 80/tcp, egress: all

resource "aws_security_group" "myalb_sg" {
  name        = "myalb_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.default.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_80" {
  security_group_id = aws_security_group.myalb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}


resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.myalb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
