provider "aws" {
  region = "us-east-1"
}

module "tags" {
  source            = "../../"
  prefix            = "example"
  terraform_managed = "1"
  data_pii          = "0"
  data_phi          = "0"
  data_pci          = "0"
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_launch_template" "test" {
  name_prefix   = "test-lt-"
  image_id      = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "test" {
  availability_zones = data.aws_availability_zones.available.names
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.test.id
    version = "$Latest"
  }

  tags = module.tags.result_asg_list
}
