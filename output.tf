# Launch configuration
output "test_asg_launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = module.asg.test_asg_launch_configuration_id
}

# Autoscaling group
output "test_asg_autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = module.asg.test_asg_autoscaling_group_id
}

# ELB DNS name
output "test_elb_elb_dns_name" {
  description = "DNS Name of the ELB"
  value       = module.elb.test_elb_elb_dns_name
}

# Endpoint of ElasticCache
output "endpoint" {
    description = "Endpoint of the ElasticCache"
    value       = module.elasticcache.endpoint
}
