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
resource "aws_security_group" "vm_sg" {
  name        = "vm-security-group"
  description = "Allow SSH and HTTP traffic"

  # Allow SSH from anywhere (Restrict to your IP in production)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
security_groups = [aws_security_group.vm_sg.name]
terraform {
  backend "s3" {
    bucket         = "test-iacm-bucket"
    key            = "harness/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
 }
}

