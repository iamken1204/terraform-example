data "aws_security_group" "sgSSH" {
  id = "sg-3a53d45d"
}

data "aws_security_group" "sgCV" {
  id = "sg-be3433d9"
}

data "aws_security_group" "sgRDS" {
  id = "sg-052dcc62"
}

output "sgSSH_ID" {
  value = "${data.aws_security_group.sgSSH.id}"
}

output "sgCV_ID" {
  value = "${data.aws_security_group.sgCV.id}"
}

output "sgRDS_ID" {
  value = "${data.aws_security_group.sgRDS.id}"
}
