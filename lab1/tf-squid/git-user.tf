resource "aws_iam_user" "git-user" {
  name = "git-user"
  force_destroy=true

  tags = {
    "workshop" = "ecsworkshop"
  }
}