data "aws_subnet" "go-service-a" {
  id = "subnet-5dec582b"
}

data "aws_subnet" "go-service-c" {
  id = "subnet-9a25dcc2"
}

output "subnet_goServiceA_ID" {
  value = "${data.aws_subnet.go-service-a.id}"
}

output "subnet_goServiceC_ID" {
  value = "${data.aws_subnet.go-service-c.id}"
}
