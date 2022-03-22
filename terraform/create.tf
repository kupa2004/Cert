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
  key_name = "my-key001"
  vpc_security_group_ids = ["sg-014aa96269c6d3b0d"]
  tags = {
    Name = var.name1
    group = "builder"
  }
}

resource "aws_instance" "stage" {
  ami = "ami-092cce4a19b438926"
  instance_type = "t3.micro"
  key_name = "my-key001"
  vpc_security_group_ids = ["sg-014aa96269c6d3b0d"]
  tags = {
    Name = var.name2
    group = "stage"
  }
}
