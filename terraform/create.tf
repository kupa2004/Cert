terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.6.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "builder" {
  ami = "ami-092cce4a19b438926"
  instance_type = "t3.micro"
  key_name = "my-key01"
  vpc_security_group_ids = ["sg-082fd21f7c55e274a"]
  tags = {
    Name = var.name1
    group = "builder"
  }
}

resource "aws_instance" "stage" {
  ami = "ami-092cce4a19b438926"
  instance_type = "t3.micro"
  key_name = "my-key01"
  vpc_security_group_ids = ["sg-082fd21f7c55e274a"]
  tags = {
    Name = var.name2
    group = "stage"
  }
}
