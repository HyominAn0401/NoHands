packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

variable "base_ami" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "region" {
  type = string
}

variable "instance_type" {
  type = string
}

source "amazon-ebs" "ubuntu" {
  region                     = var.region
  source_ami                 = var.base_ami
  instance_type              = var.instance_type
  ami_name                   = "nohands-ami1-{{timestamp}}"
  ssh_username               = "ubuntu"
  subnet_id                  = var.subnet_id
  security_group_id          = var.security_group_id
  associate_public_ip_address = true
}

build {
  name    = "nohands-image1"
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "ansible" {
    playbook_file = "./playbook.yml"
    extra_arguments  = ["--user=ubuntu"]
    ansible_env_vars = [
      "ANSIBLE_ROLES_PATH=../roles",
      "ANSIBLE_REMOTE_TEMP=/tmp/ansible-remote"
    ]
  }
}