#Create my organisations VPC
resource "aws_vpc" "Cloudqueror_VPC" {
  cidr_block       = "17.59.0.0/26"
  tags = {
    Name = "Cloudqueror_VPC"
  }
}