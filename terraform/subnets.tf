resource "aws_subnet" "elastic-test-subnet1" {
  vpc_id                  = "${aws_vpc.elastic-test-vpc.id}"
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "elastic-test-subnet1"
  }
}

resource "aws_subnet" "elastic-test-subnet2" {
  vpc_id                  = "${aws_vpc.elastic-test-vpc.id}"
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "elastic-test-subnet2"
  }
}

resource "aws_subnet" "elastic-test-subnet3" {
  vpc_id                  = "${aws_vpc.elastic-test-vpc.id}"
  cidr_block              = "10.10.3.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "elastic-test-subnet3"
  }
}

resource "aws_route_table_association" "associate-publicnetwork1" {
  subnet_id      = "${aws_subnet.elastic-test-subnet1.id}"
  route_table_id = "${aws_route_table.elastic-test-rt.id}"
}

resource "aws_route_table_association" "associate-publicnetwork2" {
  subnet_id      = "${aws_subnet.elastic-test-subnet2.id}"
  route_table_id = "${aws_route_table.elastic-test-rt.id}"
}

resource "aws_route_table_association" "associate-publicnetwork3" {
  subnet_id      = "${aws_subnet.elastic-test-subnet3.id}"
  route_table_id = "${aws_route_table.elastic-test-rt.id}"
}
