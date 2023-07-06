resource "aws_iam_role" "test_role" {
#depends_on = ["aws_instance.ec2-priv-1"]
name = "test_role"
#By default, IAM principals do not have permission to create temporary security credentials for federated users and roles. 
#This allows EC2 to assume the SSM and CloudWatch policies so VM can call out to their API's 
assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": {
      "Effect": "Allow",
      "Principal": {"Service": "ec2.amazonaws.com"},
      "Action": "sts:AssumeRole"
    }
}
EOF
}


# Also attach SSMManaged Instance Core to the test_role
resource "aws_iam_role_policy_attachment" "test_attach_core" {
  role       = "${aws_iam_role.test_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# And attach CloudWatch Agent Server Policy to test_role
resource "aws_iam_role_policy_attachment" "test_attach_cw" {
  role       = "${aws_iam_role.test_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}


# create an "instance_profile" to attach test_role to EC2 instance
resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "${aws_iam_role.test_role.name}"
}


