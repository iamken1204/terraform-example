resource "aws_db_subnet_group" "astra" {
  name = "astra"

  subnet_ids = [
    "${aws_subnet.bastion.id}",
    "${aws_subnet.api-a.id}",
    "${aws_subnet.worker-a.id}",
    "${aws_subnet.cv-a.id}",
    "${aws_subnet.cv-b.id}",
  ]

  tags {
    Name = "astra"
  }
}

resource "aws_db_instance" "astra" {
  identifier             = "astra"
  name                   = "astra"
  engine                 = "mysql"
  engine_version         = "5.7.17"
  instance_class         = "db.t2.small"
  allocated_storage      = 20
  storage_type           = "gp2"
  username               = "dba"
  password               = "1qazxsw23"
  db_subnet_group_name   = "${aws_db_subnet_group.astra.id}"
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.sgRDS.id}"]

  apply_immediately = true

  monitoring_interval = 60
  monitoring_role_arn = "arn:aws:iam::478205036267:role/rds-monitoring-role"

  backup_retention_period = 1
  backup_window           = "17:25-17:55"
}
