output "vpc_id" {
    value = aws_vpc.this.id
}

output "alb_arn" {
    value = aws_lb.this.arn
}

output "alb_dns_name" {
    value = aws_lb.this.dns_name
}

output "alb_target_group_arn" {
    value = aws_lb_target_group.this.arn
}

output "private_subnet_ids" {
    value = [for subnet in aws_subnet.private : subnet.id]
}

output "security_group_id" {
    value = aws_security_group.container.id
}