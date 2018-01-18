resource "aws_security_group" "sgOffice" {
  name   = "sgOffice"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "220.130.186.71/32",  # Astra
      "220.132.152.231/32", # Astra
    ]
  }

  ingress {
    from_port = 5334
    to_port   = 5334
    protocol  = "tcp"

    cidr_blocks = [
      "220.130.186.71/32",  # Astra
      "220.132.152.231/32", # Astra
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgOffice"
  }
}

resource "aws_security_group" "sgStaff" {
  name   = "sgStaff"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port = 5334
    to_port   = 5334
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
      "10.0.0.0/16",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgStaff"
  }
}

resource "aws_security_group" "sgCV" {
  name   = "sgCV"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 5480
    to_port   = 5480
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8000
    to_port   = 8000
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgCV"
  }
}

resource "aws_security_group" "sgRDS" {
  name   = "sgRDS"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgRDS"
  }
}

resource "aws_security_group" "sgWorker" {
  name   = "sgWorker"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgWorker"
  }
}

resource "aws_security_group" "sgStream" {
  name   = "sgStream"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port = 7080
    to_port   = 7080
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port = 5480
    to_port   = 5480
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgStream"
  }
}

resource "aws_security_group" "sgRelay" {
  name   = "sgRelay"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8888
    to_port   = 8888
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9999
    to_port   = 9999
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 7777
    to_port   = 7777
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgRelay"
  }
}

resource "aws_security_group" "sgMSP" {
  name   = "sgMSP"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgMSP"
  }
}

resource "aws_security_group" "sgAPI" {
  name   = "sgAPI"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9000
    to_port   = 9000
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgAPI"
  }
}

resource "aws_security_group" "sgRedis" {
  name   = "sgRedis"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 6379
    to_port   = 6379
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgRedis"
  }
}

resource "aws_security_group" "sgBastion" {
  name   = "sgBastion"
  vpc_id = "${aws_vpc.astra.id}"

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["220.130.186.71/32"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sgBastion"
  }
}
