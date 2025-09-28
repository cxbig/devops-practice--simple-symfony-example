terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    region       = "eu-central-1"
    bucket       = "terraform-states-p3swxflc"
    key          = "prd/terraform.tfstate"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Environment = local.env_name
      Project     = local.project_name
    }
  }
}
