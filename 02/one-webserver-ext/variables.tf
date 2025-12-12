# [입력 변수]
variable "security_group_name" {
  description = "Security group name for My EC2"
  type = string
  default = "allow_8080"
}

variable "server_port" {
    description = "server port for webserver"
    type = number
    default = 8080
}