####################################################
# Public Route Table Association
####################################################
resource "aws_route_table_association" "public_1a_to_ig" {
  subnet_id = aws_subnet.public[0].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1c_to_ig" {
  subnet_id = aws_subnet.public[1].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1d_to_ig" {
  subnet_id = aws_subnet.public[2].id
  route_table_id = aws_route_table.public.id
}

####################################################
# Private Route Table Association
####################################################
resource "aws_route_table_association" "private_1a_to_ig" {
  subnet_id = aws_subnet.private[0].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_1c_to_ig" {
  subnet_id = aws_subnet.private[1].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_1d_to_ig" {
  subnet_id = aws_subnet.private[2].id
  route_table_id = aws_route_table.private.id
}