resource "aws_vpc" "astra" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "astra"
  }
}

resource "aws_internet_gateway" "astra" {
  vpc_id = "${aws_vpc.astra.id}"

  tags {
    Name = "astra"
  }
}

resource "aws_route_table" "astra" {
  vpc_id = "${aws_vpc.astra.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.astra.id}"
  }

  tags {
    Name = "astra"
  }
}

resource "aws_main_route_table_association" "astra" {
  vpc_id         = "${aws_vpc.astra.id}"
  route_table_id = "${aws_route_table.astra.id}"
}

# Singapores AZs
# ap-southeast-1a
# ap-southeast-1b

resource "aws_subnet" "bastion" {
  vpc_id     = "${aws_vpc.astra.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "bastion"
  }
}

resource "aws_subnet" "api-a" {
  vpc_id            = "${aws_vpc.astra.id}"
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "api-a"
  }
}

resource "aws_subnet" "worker-a" {
  vpc_id            = "${aws_vpc.astra.id}"
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "worker-a"
  }
}

resource "aws_subnet" "cv-a" {
  vpc_id            = "${aws_vpc.astra.id}"
  cidr_block        = "10.0.31.0/24"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "cv-a"
  }
}

resource "aws_subnet" "cv-b" {
  vpc_id            = "${aws_vpc.astra.id}"
  cidr_block        = "10.0.32.0/24"
  availability_zone = "ap-southeast-1b"

  tags {
    Name = "cv-b"
  }
}

resource "aws_subnet" "streaming-a" {
  vpc_id            = "${aws_vpc.astra.id}"
  cidr_block        = "10.0.41.0/24"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "streaming-a"
  }
}

resource "aws_subnet" "mqtt-relay-a" {
  vpc_id            = "${aws_vpc.astra.id}"
  cidr_block        = "10.0.51.0/24"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "mqtt-relay-a"
  }
}
