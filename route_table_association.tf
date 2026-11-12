resource "aws_route_table_association" "DDHB-ASS1" {
  subnet_id      = aws_subnet.DDHB-SUBNET-01.id
  route_table_id = aws_route_table.DDHB-RT.id
}

resource "aws_route_table_association" "DDHB-ASS2" {
  subnet_id      = aws_subnet.DDHB-SUBNET-02.id
  route_table_id = aws_route_table.DDHB-RT.id
}