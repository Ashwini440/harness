resource "aws_instance" "public_instance" {
 ami           = var.ami
 instance_type = var.instance_type

 tags = {
   Name = var.name_tag,
 }
}
resource "aws_instance" "harness" {
  # The ID of the EC2 instance that you want to import
   instance_type = "t2.micro"  
   ami = "ami-08b5b3a93ed654d19"
tags = {
    Name = var.name  }
}

terraform {
  backend "s3" {
    bucket         = "harness-iacm-bucket"
    key            = "harness/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
