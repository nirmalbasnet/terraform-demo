terraform {
  backend "s3" {
    bucket = "terraform-demo-state-files"
    region = "ap-south-1"
  }
}
