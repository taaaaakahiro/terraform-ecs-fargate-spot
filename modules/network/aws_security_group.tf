resource "aws_security_group" "alb" {
  name = "${var.env}-${var.service}-alb-sg"
  description = "${var.service} alb rule based routing"
  vpc_id = aws_vpc.this.id
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env}-${var.service}-alb-sg"
  }
}

resource "aws_security_group" "container" {
  name        = "${var.env}-sg-container"
  description = "sg api container"
  vpc_id      = aws_vpc.this.id

  ingress {
    description     = "alb sg"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description     = "alb sg"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}-sg-container"
  }
}

resource "aws_security_group" "vpce" {
  name        = "${var.env}-sg-vpce"
  description = "sg vpce for docker image pull"
  vpc_id      = aws_vpc.this.id

  ingress {
    description     = "container sg"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.container.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}-sg-vpce"
  }
}
