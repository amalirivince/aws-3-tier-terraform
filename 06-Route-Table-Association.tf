#Webserver ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "Webserver_RT_association" {
  subnet_id      = aws_subnet.Webserver_subnet.id
  route_table_id = aws_route_table.Webserver_RT.id
}