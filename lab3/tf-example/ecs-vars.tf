variable "cluster_name" {
  type    = string
  default = "squid-ecr-ECSCluster"
}


variable "app_name" {
  type    = string
  default = "my-app"
}

variable "execution_role_name" {
  type    = string
  default = data.ssm_parameter.execution_role.value
}