# Configuration of SPO3-ZONE1-VPC1 #
# SPO3 = AWS South America
# ZONE1 = sa-east-1

resource "aws_vpc" "elastic-test-vpc" {
  cidr_block       = "10.10.0.0/22"

  tags = {
    Name = "elastic-test-vpc"
  }
}
resource "aws_internet_gateway" "elastic-test-igw" {
  vpc_id = "${aws_vpc.elastic-test-vpc.id}"

  tags = {
    Name = "elastic-test-igw"
  }
}

resource "aws_route_table" "elastic-test-rt" {
  vpc_id = "${aws_vpc.elastic-test-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.elastic-test-igw.id}"
  }

  tags = {
    Name = "elastic-test-rtW"
  }
}
