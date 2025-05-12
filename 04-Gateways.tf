#INTERNET GATEWAY
resource "aws_internet_gateway" "Cloudqueror-IGW" {
  vpc_id = aws_vpc.Cloudqueror_VPC.id
  tags = {
    Name = "Cloudqueror-IGW"
  }
}

# Elastic IPs for NAT GATEWAYS A
resource "aws_eip" "EIP" {
  domain   = "vpc"
}

# Elastic IPs for NAT GATEWAYS B
resource "aws_eip" "nat_b" {
  domain   = "vpc"
}


# NAT GATEWAYS A
resource "aws_nat_gateway" "NAT_Gateway" {
  allocation_id = aws_eip.EIP.id
  subnet_id     = aws_subnet.Webserver_subnet.id
  depends_on = [aws_internet_gateway.Cloudqueror-IGW]

  tags = {
    Name = "NAT_Gateway"
  }
}