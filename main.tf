terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "example_server" {
  ami           = "ami-0182f373e66f89c85"
  instance_type = "t2.micro"
  key_name      = "orewriter"
  subnet_id     = "subnet-0c21ab0247abe6e07"
  associate_public_ip_address = true

  tags = {
    Name = "belajar"
  }
}

# Output instance ID
output "instance_id" {
  value = aws_instance.example_server.id
  description = "The ID of the EC2 instance"
}

# Output public IP
output "public_ip" {
  value = aws_instance.example_server.public_ip
  description = "The public IP of the EC2 instance"
}