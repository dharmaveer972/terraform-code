locals {
  test_asg_launch_configuration_id   = var.launch_configuration == "" && var.create_lc ? concat(aws_launch_configuration.test_asg.*.id, [""])[0] : var.launch_configuration
  test_asg_launch_configuration_name = var.launch_configuration == "" && var.create_lc ? concat(aws_launch_configuration.test_asg.*.name, [""])[0] : ""

  test_asg_autoscaling_group_id                        = concat(aws_autoscaling_group.test_asg.*.id, [""])[0]
  test_asg_autoscaling_group_name                      = concat(aws_autoscaling_group.test_asg.*.name, [""])[0]
  test_asg_autoscaling_group_arn                       = concat(aws_autoscaling_group.test_asg.*.arn, [""])[0]
  test_asg_autoscaling_group_min_size                  = concat(aws_autoscaling_group.test_asg.*.min_size, [""])[0]
  test_asg_autoscaling_group_max_size                  = concat(aws_autoscaling_group.test_asg.*.max_size, [""])[0]
  test_asg_autoscaling_group_desired_capacity          = concat(aws_autoscaling_group.test_asg.*.desired_capacity, [""])[0]
  test_asg_autoscaling_group_default_cooldown          = concat(aws_autoscaling_group.test_asg.*.default_cooldown, [""])[0]
  test_asg_autoscaling_group_health_check_grace_period = concat(aws_autoscaling_group.test_asg.*.health_check_grace_period, [""])[0]
  test_asg_autoscaling_group_health_check_type         = concat(aws_autoscaling_group.test_asg.*.health_check_type, [""])[0]
  test_asg_autoscaling_group_availability_zones        = concat(aws_autoscaling_group.test_asg.*.availability_zones, [""])[0]
  test_asg_autoscaling_group_vpc_zone_identifier       = concat(aws_autoscaling_group.test_asg.*.vpc_zone_identifier, [""])[0]
  test_asg_autoscaling_group_load_balancers            = concat(aws_autoscaling_group.test_asg.*.load_balancers, [""])[0]
  test_asg_autoscaling_group_target_group_arns         = concat(aws_autoscaling_group.test_asg.*.target_group_arns, [""])[0]
}

output "test_asg_launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = local.test_asg_launch_configuration_id
}

output "test_asg_launch_configuration_name" {
  description = "The name of the launch configuration"
  value       = local.test_asg_launch_configuration_name
}

output "test_asg_autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = local.test_asg_autoscaling_group_id
}

output "test_asg_autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = local.test_asg_autoscaling_group_name
}

output "test_asg_autoscaling_group_arn" {
  description = "The ARN for test_asg AutoScaling Group"
  value       = local.test_asg_autoscaling_group_arn
}

output "test_asg_autoscaling_group_min_size" {
  description = "The minimum size of the autoscale group"
  value       = local.test_asg_autoscaling_group_min_size
}

output "test_asg_autoscaling_group_max_size" {
  description = "The maximum size of the autoscale group"
  value       = local.test_asg_autoscaling_group_max_size
}

output "test_asg_autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = local.test_asg_autoscaling_group_desired_capacity
}

output "test_asg_autoscaling_group_default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value       = local.test_asg_autoscaling_group_default_cooldown
}

output "test_asg_autoscaling_group_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value       = local.test_asg_autoscaling_group_health_check_grace_period
}

output "test_asg_autoscaling_group_health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
  value       = local.test_asg_autoscaling_group_health_check_type
}

output "test_asg_autoscaling_group_availability_zones" {
  description = "The availability zones of the autoscale group"
  value       = local.test_asg_autoscaling_group_availability_zones
}

output "test_asg_autoscaling_group_vpc_zone_identifier" {
  description = "The VPC zone identifier"
  value       = local.test_asg_autoscaling_group_vpc_zone_identifier
}

output "test_asg_autoscaling_group_load_balancers" {
  description = "The load balancer names associated with the autoscaling group"
  value       = local.test_asg_autoscaling_group_load_balancers
}

output "test_asg_autoscaling_group_target_group_arns" {
  description = "List of Target Group ARNs that apply to test_asg AutoScaling Group"
  value       = local.test_asg_autoscaling_group_target_group_arns
}