module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "symfony-stg"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.2.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "Staging"
  }
}
