resource "aws_instance" "my_instance" {
 ami           = var.ami
 instance_type = var.instance_type

user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y unzip wget
    wget -O delegate.tar.gz "https://app.harness.io/storage/harness-download/delegate/delegate.tar.gz"
    mkdir /opt/harness-delegate
    tar -xzf delegate.tar.gz -C /opt/harness-delegate
    cd /opt/harness-delegate
    chmod +x start.sh
    nohup ./start.sh &
  EOF

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

