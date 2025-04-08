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

variable "vpc_id" {
  type = string
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "nohands-ami2-{{timestamp}}"
  instance_type = "t3.small"
  region        = "ap-northeast-2"
  ssh_username  = "ubuntu"

  subnet_id     = var.subnet_id
  vpc_id        = var.vpc_id
  
  associate_public_ip_address = true
  ssh_interface = "public_ip"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
}

  build {
    name    = "nohands-image2"
    sources = ["source.amazon-ebs.ubuntu"]
  
    provisioner "shell" {
      inline = [
        "sudo apt-get update",
        "sudo apt-get install -y ansible"
      ]
    }
  
    provisioner "ansible-local" {
      playbook_file = "./playbook.yml"
      extra_arguments = [
        "--become",
        "-e", "ANSIBLE_ROLES_PATH=../roles",
        "-e", "ANSIBLE_REMOTE_TEMP=/tmp/ansible-remote"
      ]
    }
  }
}
