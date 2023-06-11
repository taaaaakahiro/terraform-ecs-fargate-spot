output "vpc_id" {
    value = aws_vpc.this.id
}

output "alb_arn" {
    value = aws_lb.this.arn
}

output "alb_dns_name" {
    value = aws_lb.this.dns_name
}

output "private_subnet_for_ecs" {
    value = aws_subnet.private
}