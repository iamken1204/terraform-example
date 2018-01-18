resource "aws_instance" "goapi" {
  tags {
    Name = "goapi"
  }

  ami                         = "ami-64542318"           # clean-base-golang1.9.2
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.api-a.id}"
  associate_public_ip_address = true
  key_name                    = "genesis"

  vpc_security_group_ids = [
    "${aws_security_group.sgOffice.id}",
    "${aws_security_group.sgStaff.id}",
    "${aws_security_group.sgAPI.id}",
  ]
}
