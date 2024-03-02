terraform {
  backend "s3" {
    bucket = "pashtun25"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}