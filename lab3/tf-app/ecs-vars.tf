variable "cluster_name" {
  type    = string
  default = "squid-ecr-ECSCluster"
}

variable "app_name" {
  type    = string
  default = "my-app"
}

           
variable "container_port" {
  type    = number
  default = 8080
}

variable "host_port" {
  type    = number
  default = 8080
}