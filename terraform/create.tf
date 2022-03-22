terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "builder" {
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = "my-key-test"
  vpc_security_group_ids = ["sg-0bc242d0a1be0d8f2"]
  tags = {
    Name = var.name1
    group = "builder"
  }
}

resource "aws_instance" "stage" {
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = "my-key-test"
  vpc_security_group_ids = ["sg-0bc242d0a1be0d8f2"]
  tags = {
    Name = var.name2
    group = "stage"
  }
}
