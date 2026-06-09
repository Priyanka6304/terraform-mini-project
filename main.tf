resource "aws_instance" "webserver1" {

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id_1
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = true

  user_data = file("userdata.sh")

  tags = {
    Name = "${var.project_name}-server1"
  }
}

resource "aws_instance" "webserver2" {

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id_2
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = true

  user_data = file("userdata1.sh")

  tags = {
    Name = "${var.project_name}-server2"
  }
}