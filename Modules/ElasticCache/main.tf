data "aws_vpc" "vpc" {
    id = var.vpc_id
}

resource "aws_elasticache_replication_group" "testredis" {
    replication_group_id          = "Examrediscluster"
    replication_group_description = "Terraform-managed ElastiCache replication group"
    number_cache_clusters         = var.redis_clusters
    node_type                     = var.redis_node_type
    automatic_failover_enabled    = var.redis_failover
    engine_version                = var.redis_version
    port                          = var.redis_port
    parameter_group_name          = aws_elasticache_parameter_group.redis_parameter_group.id
    subnet_group_name             = aws_elasticache_subnet_group.redis_subnet_group.id
    security_group_ids            = [aws_security_group.redis_security_group.id]
    apply_immediately             = var.apply_immediately
    maintenance_window            = var.redis_maintenance_window
    snapshot_window               = var.redis_snapshot_window
    snapshot_retention_limit      = var.redis_snapshot_retention_limit
    tags                          = var.tags
}

resource "aws_elasticache_parameter_group" "redis_parameter_group" {
    name = var.parameter_group_name
    description = "Terraform-managed ElastiCache parameter group"
    # Strip the patch version from redis_version var
    family = "redis${replace(var.redis_version, "/\\.[\\d]+$/", "")}"
    lifecycle {
    create_before_destroy = true
    }
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
    name       = var.redis_subnet_group_name
    subnet_ids = var.subnets
}
