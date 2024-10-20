provider "aws" {
  region = "us-east-1"
#   profile = var.aws_profile
}


# Chave SSH pública
resource "aws_key_pair" "my_key" {
  key_name   = "ansible-key"
  public_key = file("~/.ssh/puppet.pub") # Caminho da sua nova chave pública
}



# data "aws_ami" "ubuntu" {

#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/*-amd64-server-*"]
#   }


#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"]
# }

# output "test" {
#   value = data.aws_ami.ubuntu
# }


# Criar múltiplas instâncias EC2 usando count
resource "aws_instance" "ansible" {
  count         = var.instance_count
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.ansible_sg.name]

#   user_data = <<-EOF
#               #!/bin/bash
#               sudo apt update
#               sudo apt install software-properties-common
#               sudo add-apt-repository --yes --update ppa:ansible/ansible
#               sudo apt install ansible
#               EOF

  tags = {
    Name = "ansible-instance-centos${count.index + 1}"
  }
}

# Output do endereço público das VMs
output "instance_public_ips" {
  description = "The public IPs of the ansible instances."
  value       = aws_instance.ansible[*].public_dns
}

