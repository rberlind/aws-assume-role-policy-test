terraform {
  required_version = ">= 0.12"
}

variable "role" {
  description = "IAM Role to assume"
  default     = "arn:aws:iam::753646501470:role/roger-terraform-assumed-role"
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = var.role
  }
}

resource "aws_instance" "web" {
  ami           = "ami-2e1ef954"
  instance_type = "t2.micro"

  tags = {
    Name = "assumed_role_instance"
  }
}

