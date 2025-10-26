resource "aws_instance" "public_instance" {
  ami               = "ami-02d26659fd82cf299"
  subnet_id         = aws_subnet.public_subnet.id
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1a"
  associate_public_ip_address = true
  key_name          = "my-ssh"
  tags = {
    Name = "internet facing instance"
  }
  security_groups = [aws_security_group.public_sg.id]
}

resource "aws_instance" "private_instance" {
  ami               = "ami-02d26659fd82cf299"
  subnet_id         = aws_subnet.private_subnet.id
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name          = "my-ssh"
  tags = {
    Name = "private instance"
  }
  security_groups = [aws_security_group.public_sg.id]
}
