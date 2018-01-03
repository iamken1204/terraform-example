resource "aws_instance" "bastion" {
  tags {
    Name = "bastion"
  }

  ami                         = "ami-10acfb73"             # Ubuntu16.04 - Singapore
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.bastion.id}"
  associate_public_ip_address = true
  key_name                    = "genesis"

  vpc_security_group_ids = [
    "${aws_security_group.sgOffice.id}",
    "${aws_security_group.sgStaff.id}",
  ]
}
