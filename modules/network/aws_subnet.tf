resource "aws_subnet" "public" {
    vpc_id = aws_vpc.this.id
    count = var.subnet_count
    availability_zone = var.availability_zones[count.index]
    cidr_block        = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index)
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.this.id
    count = var.subnet_count
    availability_zone = var.availability_zones[count.index]
    cidr_block        = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + length(aws_subnet.public))

}