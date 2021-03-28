### General variables  ###
variable "region" {
  default = "eu-north-1"
}

### Networking variables ###
variable "vpc_name" {
  default = "test-vpc"
}

variable "network_address_space" {
  default = "10.0.0.0/16"
  description = "VPC network address space"
}

variable "private_subnets_addr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets_addr" {
  default = ["10.0.4.0/24", "10.0.5.0/24"]
}

### EC2 related variables ###
variable "ssh_public_key" {}

### Misc. variables ##
variable "environment" {
    default = "tst"
}

variable "default_tags" {
    default = {
        "Terraform"   = "true"
    }
 
}

### EC2 Security group variables ###
variable "ssh_inbound_ip" {
  default = "0.0.0.0/0"
}

