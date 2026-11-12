data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2-01" {
  instance_type          = "t3.micro"
  ami                    = data.aws_ami.amazon-linux.id
  subnet_id              = aws_subnet.DDHB-SUBNET-01.id
  vpc_security_group_ids = [aws_security_group.DDHB-SG-01.id]
  key_name               = aws_key_pair.my_keypair.key_name
  tags = {
    Name = "ec2-01"
  }
}

resource "aws_instance" "ec2-02" {
  instance_type          = "t3.micro"
  ami                    = data.aws_ami.amazon-linux.id
  subnet_id              = aws_subnet.DDHB-SUBNET-02.id
  vpc_security_group_ids = [aws_security_group.DDHB-SG-02.id]
  key_name               = aws_key_pair.my_keypair.key_name
  tags = {
    Name = "ec2-02"
  }
}