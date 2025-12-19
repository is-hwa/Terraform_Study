# vpc_id
# public_subnet_id
# internet_gateway_id
# public_route_table_id
output "vpc_id" {
  value = aws_vpc.main.id
}
