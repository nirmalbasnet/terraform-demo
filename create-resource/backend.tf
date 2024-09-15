terraform {
  backend "s3" {
    bucket = "nirmalbasnet"
    region = "ap-south-1"
    key    = "terraform-demo/state-files"
  }
}
