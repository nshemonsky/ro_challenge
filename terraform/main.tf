# Build our vpc
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ro-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Terraform   = "true"
    Environment = "ro"
  }
}

# Open up access for our server
module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "web-server"
  description = "Allow SSH and HTTP access"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp","http-80-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}

resource "aws_instance" "web_server" {
  count = 1

  ami                         = "${lookup(var.ami, var.region)}"
  instance_type               = "t2.small"
  key_name                    = "ro-challenge"
  vpc_security_group_ids      = ["${module.web_server_sg.this_security_group_id}"]
  subnet_id                   = "${element(module.vpc.public_subnets, 0)}"
  associate_public_ip_address = true

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y git",
      "cd /tmp && /usr/bin/git clone https://github.com/nshemonsky/ro_challenge.git",
      "sudo rpm -Uvh https://packages.chef.io/files/stable/chefdk/2.4.17/el/7/chefdk-2.4.17-1.el7.x86_64.rpm",
      "eval \"$(chef shell-init bash)\"",
      "cd /tmp/ro_challenge",
      "berks vendor cookbooks/ -b cookbooks/flask_app/Berksfile",
      "sudo chef-client -z -o flask_app | tee /tmp/chef_bootstrap.log"
    ]

    connection {
      private_key = "${file(var.key_path)}"
      agent       = "false"
      user        = "ec2-user"
    }
  }
}
