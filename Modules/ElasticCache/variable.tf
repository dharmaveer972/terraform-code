variable "security_group_name" {
  description = "Name for the security group for redis"
  type        = string
}

variable "apply_immediately" {
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false."
  type        = bool
  default     = false
}

variable "allowed_cidr" {
  description = "A list of ip range to allow access to."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "name" {
  description = "Name for the Redis replication group i.e. UserObject"
  type        = string
}

variable "parameter_group_name" {
    description = "Name for the Redis parameter Group"
    type        = string
}

variable "redis_clusters" {
  description = "Number of Redis cache clusters (nodes) to create"
  type        = string
}

variable "redis_failover" {
  type    = bool
  default = false
}

variable "redis_node_type" {
  description = "Instance type to use for creating the Redis cache clusters"
  type        = string
  default     = ""
}

variable "redis_port" {
  type    = number
  default = 6379
}

variable "subnets" {
  type        = list(string)
  description = "List of VPC Subnet IDs for the cache subnet group"
}

# might want a map
variable "redis_version" {
  description = "Redis version to use, defaults to 3.2.10"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "redis_maintenance_window" {
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period"
  type        = string
  default     = ""
}

variable "redis_snapshot_window" {
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period"
  type        = string
  default     = ""
}

variable "redis_snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro or cache.t2.* cache nodes"
  type        = number
  default     = 0
}

variable "tags" {
  description = "Tags for redis nodes"
  type        = map(string)
  default     = {}
}

variable "redis_subnet_group_name" {
  description = "Name for the Subnet"
  type        = string
}

