resource "aws_internet_gateway" "DDHB-IGW" {
  vpc_id = aws_vpc.DDHB-VPC.id
  tags = {
    Name = "DDHB-IGW"
  }
}