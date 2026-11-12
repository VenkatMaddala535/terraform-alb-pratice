resource "aws_subnet" "DDHB-SUBNET-01" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.DDHB-VPC.id
  availability_zone = "us-east-1a"
  tags = {
    Name = "DDHB-SUBNET-01"
  }
}

resource "aws_subnet" "DDHB-SUBNET-02" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.DDHB-VPC.id
  availability_zone = "us-east-1b"
  tags = {
    Name = "DDHB-SUBNET-02"
  }
}