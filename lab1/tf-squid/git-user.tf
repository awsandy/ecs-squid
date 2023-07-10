resource "aws_iam_user" "git-user" {
  name = "git-user"
  force_destroy=true

  tags = {
    "workshop" = "ecsworkshop"
  }
}


resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.git-user.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser"
}