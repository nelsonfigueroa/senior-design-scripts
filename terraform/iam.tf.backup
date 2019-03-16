# create users
resource "aws_iam_user" "user_one" {
  name = "mark"
}

# create policy
resource "aws_iam_policy" "administrators_policy" {
  name        = "AdministratorsPolicy"
  description = "Administrators Policy "
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

# create IAM group
resource "aws_iam_group" "administrators" {
  name = "test_administrators"
  path = "/users/"
}

# attach policy to group
resource "aws_iam_group_policy_attachment" "administrator_group_attach" {
  group      = "${aws_iam_group.administrators.name}"
  policy_arn = "${aws_iam_policy.administrators_policy.arn}"
}

# add users to group
resource "aws_iam_group_membership" "admin_group" {
  name = "tf-testing-group-membership"

  users = [
    "${aws_iam_user.user_one.name}"#,
    #"${aws_iam_user.user_two.name}",
  ]

  group = "${aws_iam_group.administrators.name}"
}
