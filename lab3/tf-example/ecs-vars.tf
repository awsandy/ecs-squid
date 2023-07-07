variable "cluster_name" {
  type    = string
  default = "squid-ecr-ECSCluster"
}

variable "app_name" {
  type    = string
  default = "my-app"
}

           
variable "container_port" {
  type    = string
  default = "80"
}

variable "host_port" {
  type    = string
  default = "80"
}