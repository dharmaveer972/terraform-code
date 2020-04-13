provider "aws" {
    region = "us-east-1"
}

##############################################################
# Data sources to get VPC, subnets and security group details
##############################################################
data "aws_vpc" "vpc" {
    id = var.vpc_id
}

data "aws_subnet_ids" "all" {
    vpc_id = data.aws_vpc.vpc.id
}

data "aws_ami" "amazon_linux" {
    most_recent = true
    owners      = ["137112412989"]

    filter {
        name = "name"
        values = ["amzn-ami-hvm-*-x86_64-gp2"]
    }
}

######
# Launch configuration and autoscaling group
######
module "asg" {
    source = "./Modules/ASG"
    name = "TestAutoScalingGroup"
    create_lc = true
    lc_name = "TestLaunchConfiguration"
    image_id        = data.aws_ami.amazon_linux.id
    instance_type   = "t2.micro"
    security_groups = [aws_security_group.autoscaling_security_group.id]
    load_balancers  = [module.elb.test_elb_elb_id]

    ebs_block_device = [
    {
        device_name           = "/dev/xvdz"
        volume_type           = "gp2"
        volume_size           = "50"
        delete_on_termination = true
    },
    ]

    root_block_device = [
    {   
        volume_size = "50"
        volume_type = "gp2"
    },
    ]

    # Auto scaling group
    asg_name                  = "TestAutoScalingGroup"
    vpc_zone_identifier       = data.aws_subnet_ids.all.ids
    health_check_type         = "EC2"
    min_size                  = 2
    max_size                  = 4
    desired_capacity          = 2
    wait_for_capacity_timeout = 0

    tags = [
    {
        key                 = "Environment"
        value               = "Exam"
        propagate_at_launch = true
    }
    ]
}

######
# ELB
######
module "elb" {
    source = "./Modules/ELB"
    name = "TestElasticLoadBalancer"
    subnets         = data.aws_subnet_ids.all.ids
    security_groups = [aws_security_group.autoscaling_security_group.id]
    internal        = false

    listener = [
    {
        instance_port     = "80"
        instance_protocol = "HTTP"
        lb_port           = "80"
        lb_protocol       = "HTTP"
    },
    ]

    health_check = {
        target              = "HTTP:80/"
        interval            = 30
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 5
    }

    tags = {
        Owner       = "user"
        Environment = "Exam"
    }
}


####################
# ElasticCache
####################

module "elasticcache" {
    source = "./Modules/ElasticCache"
    security_group_name = "redisexamsecurity"
    name = "redisexamcluster"
    parameter_group_name = "redisexam"
    redis_clusters = "1"
    redis_node_type = "cache.t2.micro"
    redis_subnet_group_name = "examsubnet"
    subnets = data.aws_subnet_ids.all.ids
    redis_version = "5.0"
    vpc_id = data.aws_vpc.vpc.id
}
