resource "aws_network_acl" "NACL" {
  vpc_id = aws_vpc.Cloudqueror_VPC.id
  tags = {
    Name = "NACL"
    }
}

resource "aws_network_acl_rule" "NACL-Rule" {
  network_acl_id = aws_network_acl.NACL.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}