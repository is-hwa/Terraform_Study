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
