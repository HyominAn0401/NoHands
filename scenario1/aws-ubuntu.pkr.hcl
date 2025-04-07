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

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

source "amazon-ebs" "ubuntu" {
  region                     = "ap-northeast-2"
  source_ami                 = "ami-05a7f3469a7653972"
  instance_type              = "t2.micro"
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
    extra_arguments  = ["--user=ubuntu", "--become"]
    ansible_env_vars = [
      "ANSIBLE_ROLES_PATH=/workspace/roles",
    "ANSIBLE_REMOTE_TEMP=/tmp/ansible-remote"
    ]
  }
}