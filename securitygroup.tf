resource "aws_security_group" "autoscaling_security_group" {
  name        = "examsecuritygroup"
  description = "Terraform-managed ElastiCache security group"
  vpc_id      = data.aws_vpc.vpc.id
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.allowed_cidr
  security_group_id = aws_security_group.autoscaling_security_group.id
}

resource "aws_security_group_rule" "https_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.allowed_cidr
  security_group_id = aws_security_group.autoscaling_security_group.id
}

resource "aws_security_group_rule" "redis_ingress" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  cidr_blocks       = var.allowed_cidr
  security_group_id = aws_security_group.autoscaling_security_group.id
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.allowed_cidr
  security_group_id = aws_security_group.autoscaling_security_group.id
}
