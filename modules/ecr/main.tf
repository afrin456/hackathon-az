resource "aws_ecr_repository" "patient" {
  name = "${var.env}-patient-repo"
}

