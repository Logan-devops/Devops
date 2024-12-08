provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-0e2c8caa4b6378d8c" # Ubuntu Server 20.04 LTS AMI for us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "UbuntuInstance"
  }
}

output "instance_public_ip" {
  value = aws_instance.ubuntu_instance.public_ip
}
