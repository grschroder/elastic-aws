resource "aws_security_group" "elastic-test-sg" {
  name        = "elastic-test-sg"
  description = "Default access rules"
  vpc_id      = "${aws_vpc.elastic-test-vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    description = "Allow SSH Access"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5601
    to_port     = 5601
    description = "Allow Kibana access"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 9200
    to_port     = 9200
    description = "Allow elastic comm - temp"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 9300
    to_port     = 9300
    description = "Allow elastic comm - temp"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = -1
    to_port     = -1
    description = "Allow icmp"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

