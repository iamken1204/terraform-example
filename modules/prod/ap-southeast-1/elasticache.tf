resource "aws_elasticache_subnet_group" "astra-redis" {
  name       = "astra-redis"
  subnet_ids = ["${aws_subnet.bastion.id}"]
}

resource "aws_elasticache_cluster" "astra" {
  cluster_id           = "astra"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  port                 = 6379
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  subnet_group_name    = "${aws_elasticache_subnet_group.astra-redis.id}"

  tags {
    Name = "astra"
  }
}
