resource "aws_route_table" "DDHB-RT" {
  vpc_id = aws_vpc.DDHB-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.DDHB-IGW.id
  }
  tags = {
    Name = "DDHB-RT"
  }
}