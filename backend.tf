terraform {
  backend "s3" {

    bucket       = "priyanka-terraform-state"
    key          = "mini-project/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}