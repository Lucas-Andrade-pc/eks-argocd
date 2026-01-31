resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name = "${local.env}-nat"
  }
}
resource "aws_nat_gateway" "nat-igw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_zone[0].id
  tags = {
    "Name" = "${local.env}-nat"
  }
  depends_on = [aws_internet_gateway.igw]
}