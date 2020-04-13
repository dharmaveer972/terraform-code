resource "aws_security_group" "redis_security_group" {
  name        = var.security_group_name
  description = "Terraform-managed ElastiCache security group"
  vpc_id      = data.aws_vpc.vpc.id
}

resource "aws_security_group_rule" "redis_networks_ingress" {
  type              = "ingress"
  from_port         = var.redis_port
  to_port           = var.redis_port
  protocol          = "tcp"
  cidr_blocks       = var.allowed_cidr
  security_group_id = aws_security_group.redis_security_group.id
}