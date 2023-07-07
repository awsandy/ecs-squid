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

resource "null_resource" "load_ecr" {
  triggers = {
    always_run = timestamp()
  }
  #depends_on = [aws_ecr_repository.busybox]
  provisioner "local-exec" {
    on_failure  = fail
    when        = create
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT



        echo "************************************************************************************"
     EOT
  }
}