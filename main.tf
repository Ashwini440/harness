resource "aws_instance" "my_instance" {
 ami           = var.ami
 instance_type = var.instance_type
 tags = {
   Name = var.name_tag,
 }
}

terraform {
  backend "s3" {
    bucket         = "test-iacm-bucket"
    key            = "harness/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
 }
}

