resource "aws_ecr_repository" "this" {
  name = var.app_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

data "aws_ecr_authorization_token" "temporary" {
  registry_id = data.aws_caller_identity.current.account_id
}

provider "dockerless" {
  registry_auth = {
    "${data.aws_caller_identity.this.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com" = {
      username = data.aws_ecr_authorization_token.temporary.user_name
      password = data.aws_ecr_authorization_token.temporary.password
    }
  }
}

resource "dockerless_remote_image" "this" {
  source = format("%s:latest",var.app_name)
  target = format("%s:%s",aws_ecr_repository.this.repository_url,var.app_name)
}