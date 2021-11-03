# Configure AWS EC2 Instance
terraform {
  backend "remote" {
    organization = "colinphillips-mock"
    workspaces {
        name = "AWS-EC2-State"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  count         = 2

  tags = {
    Name = var.instance_name
  }
}

resource "aws_s3_bucket" "b" {
  bucket = var.s3_name
  acl    = "private"

  tags = {
    Name        = var.s3_tag_name
    Environment = "Dev"
  }
}