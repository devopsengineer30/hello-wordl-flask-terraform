provider "aws" {
  region = "eu-central-1"
  profile = var.aws-profile
}

terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-bucket-pavan26devops"
    key            = "aws/bitwala/terraform.tfstate"
    region         = "us-east-1"
    profile        = "saa-general"
    dynamodb_table = "pavan26devops-terraform-remote-state-lock"
    encrypt        = true
  }
}


terraform {
  required_version = ">= 0.12.0"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}
