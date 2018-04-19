variable "role" {
  description = "IAM Role to assume"
}

provider "aws" {
  region     = "us-east-1"
  assume_role {
    #role_arn     = "arn:aws:iam::128997349609:role/terraform-role"
    role_arn = "${var.role}"
    session_name = "SESSION_NAME"
    external_id  = "EXTERNAL_ID"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-2e1ef954"
  instance_type = "t2.micro"

  tags {
    Name = "assumed_role_instance"
  }
}
