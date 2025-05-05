#Webserver ROUTE TABLES
resource "aws_route_table" "Webserver_RT" {
  vpc_id = aws_vpc.Cloudqueror_VPC.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Cloudqueror-IGW.id
  }
  tags = {
    Name = "Webserver_RT"
  }
}

#Database ROUTE TABLES 
# resource "aws_route_table" "Database_RT" {
  # vpc_id = aws_vpc.Cloudqueror_VPC.id
  # route {
    # cidr_block = "0.0.0.0/0"
    # nat_gateway_id = aws_nat_gateway.NAT_Gateway.id
  # }
  # tags = {
    # Name = "Database_RT"
  # }
# }

#DevOps ROUTE TABLES B
# resource "aws_route_table" "DevOps_RT" {
  # vpc_id = aws_vpc.Cloudqueror_VPC.id
  # route {
    # cidr_block = "0.0.0.0/0"
    # nat_gateway_id = aws_nat_gateway.NAT_Gateway.id
  # }
  # tags = {
    # Name = "DevOps_RT"
  # }
# }
