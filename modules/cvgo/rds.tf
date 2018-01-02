resource "aws_db_instance" "cvgo" {
  identifier             = "cvgo"
  name                   = "cvgo"
  engine                 = "mysql"
  engine_version         = "5.7.17"
  instance_class         = "db.t2.small"
  allocated_storage      = 20
  storage_type           = "gp2"
  username               = "dba"
  password               = "1qazxsw23"
  db_subnet_group_name   = "default-vpc-12659276"
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = ["${var.sgRDS_ID}"]

  skip_final_snapshot = true
  apply_immediately   = true

  monitoring_interval = 60
  monitoring_role_arn = "arn:aws:iam::478205036267:role/rds-monitoring-role"

  backup_retention_period = 1
  backup_window           = "17:25-17:55"

  # publicly_accessible  = true
}
