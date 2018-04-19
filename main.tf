provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::128997349609:role/terraform-role"
    session_name = "SESSION_NAME"
    external_id  = "EXTERNAL_ID"
  }
}
