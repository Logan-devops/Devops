provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

resource "aws_instance" "east_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (for us-east-1)
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  tags = {
    Name = "EastInstance"
  }
}

resource "aws_instance" "west_instance" {
  provider      = aws.west
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (for us-west-2)
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  tags = {
    Name = "WestInstance"
  }
}

output "east_instance_public_ip" {
  value = aws_instance.east_instance.public_ip
}

output "west_instance_public_ip" {
  value = aws_instance.west_instance.public_ip
}
