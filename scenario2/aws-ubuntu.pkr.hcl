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

source "amazon-ebs" "ubuntu" {
  ami_name      = "nohands-ami2-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "ap-northeast-2"
  ssh_username  = "ubuntu"

  subnet_id     = "subnet-09fe04dc1acd12af7"     # subnet
  vpc_id        = "vpc-0ae95107e637880db"        # vpc
  
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

  provisioner "ansible" {
    playbook_file = "./playbook.yml"
    extra_arguments  = ["--user=ubuntu"]
    ansible_env_vars = [
      "ANSIBLE_ROLES_PATH=../roles",
      "ANSIBLE_REMOTE_TEMP=/tmp/ansible-remote"
    ]
  }
}

