variable "vpc_cidr" {
  description = "new VPC's cidr block"
  type = string
  default = "10.0.0.0/16"
}

variable "Subnet_cidr" {
  description = "new Subnet's cidr block"
  type = string
  default = "10.0.1.0/24"
}