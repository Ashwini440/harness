resource "aws_instance" "public_instance" {
 ami           = var.ami
 instance_type = var.instance_type

 tags = {
   Name = var.name_tag,
 }
}
resource "aws_instance" "harness" {
  # The ID of the EC2 instance that you want to import
  instance_id = "i-0041c8a05c7fd58af"  # Replace with your actual instance ID
}

terraform {
  backend "s3" {
    bucket         = "harness-iacm-bucket"
    key            = "harness/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
