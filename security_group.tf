resource "aws_security_group" "DDHB-SG-01" {
  description = "allows all ssh"
  vpc_id      = aws_vpc.DDHB-VPC.id

  ingress {
    description = "allows all ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allows all ssh"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "DDHB-SG-01"
  }
}

resource "aws_security_group" "DDHB-SG-02" {
  description = "allows all ssh"
  vpc_id      = aws_vpc.DDHB-VPC.id

  ingress {
    description = "allows all ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allows all ssh"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "wDDHB-SG-02"
  }
}