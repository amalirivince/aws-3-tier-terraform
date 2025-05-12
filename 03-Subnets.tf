#Public Subnets Web-Server
resource "aws_subnet" "Webserver_subnet" {
  vpc_id     = aws_vpc.Cloudqueror_VPC.id
  cidr_block = "17.59.0.0/28"
  availability_zone = "${var.availability_zone}"
  map_public_ip_on_launch = true
  tags = {
    Name = "Webserver_subnet"
  }
}

#Private Subnets Database
resource "aws_subnet" "Database_subnet" {
  vpc_id     = aws_vpc.Cloudqueror_VPC.id
  cidr_block = "17.59.0.16/28"
  availability_zone = "${var.availability_zone}"
  tags = {
    Name = "Database_subnet"
  }
}

#Private Subnets DevOps
resource "aws_subnet" "Devops_subnet" {
  vpc_id     = aws_vpc.Cloudqueror_VPC.id
  cidr_block = "17.59.0.32/28"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Devops_subnet"
  }
}

# Private Subnet Grouping
resource "aws_db_subnet_group" "private_subnet_group" {
  name       = "private_subnet_group"
  subnet_ids = [aws_subnet.Database_subnet.id, aws_subnet.Devops_subnet.id]
  
  tags = {
    Name = "Private_Subnet_Group"
  }
}
