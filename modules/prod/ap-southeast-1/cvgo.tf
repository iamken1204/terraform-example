variable "cvgo_ami_ID" {
  type    = "string"
  default = "ami-d15225ad"
}

variable "cvgo_role_name" {
  type    = "string"
  default = "GenesisCV"
}

resource "aws_sqs_queue" "cvgo" {
  name                      = "cvgo"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 3
}

resource "aws_instance" "cvgo_base" {
  tags {
    "Name" = "[genesis] py-cvgo (base)"
  }

  ami                         = "${var.cvgo_ami_ID}"
  instance_type               = "c4.large"
  subnet_id                   = "${aws_subnet.cv-a.id}"
  iam_instance_profile        = "${var.cvgo_role_name}"
  associate_public_ip_address = true
  monitoring                  = true
  ebs_optimized               = true

  vpc_security_group_ids = [
    "${aws_security_group.sgCV.id}",
    "${aws_security_group.sgOffice.id}",
    "${aws_security_group.sgStaff.id}",
  ]
}
