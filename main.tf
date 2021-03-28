# Create VPC
module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "2.77.0"
  name            = var.vpc_name
  cidr            = var.network_address_space
  azs             = data.aws_availability_zones.available.names
  private_subnets = var.private_subnets_addr
  public_subnets  = var.public_subnets_addr
  tags            = var.default_tags
}

# Creates EC2 instance and installs OpenTTD in it 
module "opentdd-server" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "2.17.0"
  user_data                   = file("files/install_openttd.sh")
  name                        = "openttd-server"
  instance_count              = 1
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  key_name                    = module.openttd-admin-key-pair.this_key_pair_key_name
  vpc_security_group_ids      = [module.openttd-server-sg.this_security_group_id]
  associate_public_ip_address = "true"
  subnet_id                   = module.vpc.public_subnets[0]
  tags                        = var.default_tags
}

