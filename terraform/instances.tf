
#resource "aws_key_pair" "schroder-test-temp" {
#  key_name   = "schroder-test-temp"
#  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCXY3DGHW7UVfprRGIywObQIJ30uWN+EXMnOjwV74wMj3FMA0gKBkcYFMfDH+5eo+q37q2riT9l/12bghsueH4eLtUAO97pcpS3HWqYPiMPFyqlGaJane6zMDGWFJM04bZLd4ic97mG2/IxwIK/GAWAD2PQYIyHeSciHz4FsGHf5fTueM2pzbsMwpMW0BmtmpTwEW3YYzVu4zcsyiT/gUVFWquaYZyFxMH0aNx0UxemFwi8ZKvmP5OMZa+25f5sqfrhwnj18ApjVIrvjhKvZr8HrjCM4ywHbcYLda/RbT4drhmhC3EcCRT+ItJDcplVB6wPlkCrKSnufepFRZU4Oqwp"
#}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "es01-test" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.medium"
  #instance_type = "t2.micro"
  subnet_id = "${aws_subnet.elastic-test-subnet1.id}"
  key_name = "schroder-test-temp"
  vpc_security_group_ids = [
      "${aws_security_group.elastic-test-sg.id}"
  ]

  user_data = "${file("prepare_es01.sh")}"

  tags = {
    Name = "es01-test"
  }
}


resource "aws_instance" "es02-test" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.medium"
  #instance_type = "t2.micro"
  #subnet_id = "${aws_subnet.elastic-test-subnet2.id}"
  subnet_id = "${aws_subnet.elastic-test-subnet1.id}"
  key_name = "schroder-test-temp"
  vpc_security_group_ids = [
      "${aws_security_group.elastic-test-sg.id}"
  ]

  user_data = "${file("prepare_es02.sh")}"
  tags = {
    Name = "es02-test"
  }
}

resource "aws_instance" "es03-test" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.medium"
  #instance_type = "t2.micro"
  #subnet_id = "${aws_subnet.elastic-test-subnet3.id}"
  subnet_id = "${aws_subnet.elastic-test-subnet1.id}"
  key_name = "schroder-test-temp"
  vpc_security_group_ids = [
      "${aws_security_group.elastic-test-sg.id}"
  ]
  
  user_data = "${file("prepare_es03.sh")}"
  
  tags = {
    Name = "es03-test"
  }
}

output "instance_ips" {
  value = [
    "${aws_instance.es01-test.*.public_ip}",
    "${aws_instance.es02-test.*.public_ip}",
    "${aws_instance.es03-test.*.public_ip}"
  ]
}


