resource "aws_instance" "cvgo_base" {
  tags {
    "Name" = "[prod] py-cvgo (base)-v12"
  }

  ami                         = "${var.cvgo_ami_ID}"
  instance_type               = "c4.xlarge"
  subnet_id                   = "${var.subnet_goServiceA_ID}"
  iam_instance_profile        = "NTT_service_role"
  associate_public_ip_address = true
  monitoring                  = true
  ebs_optimized               = true

  vpc_security_group_ids = [
    "${var.sgSSH_ID}",
    "${var.sgCV_ID}",
  ]

  connection {
    user        = "ec2-user"
    private_key = "${file("/Users/kettan/.ssh/id_rsa")}"
  }
}
