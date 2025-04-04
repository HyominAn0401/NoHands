packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "nohands-ami-{{timestamp}}" 
  instance_type = "t2.micro"
  region        = "ap-northeast-2"          
  source_ami    = "ami-05a7f3469a7653972"        
  ssh_username  = "ubuntu"                
}

build {
  name    = "nohands-packer"
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "ansible" {
    playbook_file = "./playbook.yml"
  }
}

