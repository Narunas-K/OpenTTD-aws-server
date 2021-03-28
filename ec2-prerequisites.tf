# Create SSH key pair to connect to EC2 instance
module "openttd-admin-key-pair" {
  source     = "terraform-aws-modules/key-pair/aws"
  version    = "0.6.0"
  key_name   = "openttd-admin"
  public_key = var.ssh_public_key
  tags       = var.default_tags
}

# Creates security group for OpenTTD server
module "openttd-server-sg" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "3.18.0"
  name        = "openttd-server-sg"
  description = "Open TTD server Security Groups"
  vpc_id      = module.vpc.vpc_id
  tags        = var.default_tags
  ingress_with_cidr_blocks = [
    {
      from_port   = "3979"
      to_port     = "3979"
      protocol    = "udp"
      description = "Allow to connect to OpenTTD server"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = "3979"
      to_port     = "3979"
      protocol    = "tcp"
      description = "Allow to connect to OpenTTD server"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = "22"
      to_port     = "22"
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = var.ssh_inbound_ip
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = "80"
      to_port     = "80"
      protocol    = "tcp"
      description = "Allow common outbound"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = "443"
      to_port     = "443"
      protocol    = "tcp"
      description = "Allow common outbound"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = "53"
      to_port     = "53"
      protocol    = "tcp"
      description = "Allow common outbound"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = "123"
      to_port     = "123"
      protocol    = "tcp"
      description = "Allow common outbound"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}