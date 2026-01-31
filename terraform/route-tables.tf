resource "aws_route_table" "route-table-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-igw.id
  }
  tags = {
    Name = "${local.env}-private"
  }
}
resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${local.env}-public"
  }
}
resource "aws_route_table_association" "route_table_association_private_zone" {
  count          = length(var.private_subnet)
  subnet_id      = aws_subnet.private_zone[count.index].id
  route_table_id = aws_route_table.route-table-private.id
}

resource "aws_route_table_association" "route_table_association_public_zone" {
  count          = length(var.public_subnet)
  subnet_id      = aws_subnet.public_zone[count.index].id
  route_table_id = aws_route_table.route-table-public.id
}
