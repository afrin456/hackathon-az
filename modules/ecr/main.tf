resource "aws_ecr_repository" "patient" {
  name = "${var.env}-patient-repo"
}

resource "aws_ecr_repository" "application" {
  name = "${var.env}-patient"
}
