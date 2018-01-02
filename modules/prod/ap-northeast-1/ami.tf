data "aws_ami" "ami_cvgo" {
  most_recent      = true
  executable_users = ["self", "306006842612"]

  name_regex = ".*py-cv.*"
}

output "cvgo_ami_ID" {
  value = "${data.aws_ami.ami_cvgo.id}"
}

output "cvgo_ami_ID_asg" {
  value = "ami-1760f771"
}
